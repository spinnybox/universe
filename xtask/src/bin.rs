use std::collections::BTreeMap;
use std::env;
use std::path::Path;
use std::path::PathBuf;
use std::process;

use anyhow::anyhow;
use anyhow::Result;
use binstalk::helpers::jobserver_client::LazyJobserverClient;
use cargo_binstall::args::Args;
use cargo_binstall::bin_util::run_tokio_main;
use cargo_binstall::entry::install_crates;
use cargo_metadata::MetadataCommand;
use cargo_toml::Dependency;
use cargo_toml::Manifest;
use clap::Parser;

#[derive(Debug, Clone)]
struct BinaryDetails {
  name: String,
  version: String,
  root: PathBuf,
  installation_name: Option<String>,
}

impl BinaryDetails {
  fn get_binary_path(&self) -> PathBuf {
    self.root.join(self.name.as_str())
  }

  fn get_install_name(&self) -> String {
    self
      .installation_name
      .clone()
      .unwrap_or_else(|| self.name.clone())
  }
}

struct RootDeps {
  deps: BTreeMap<String, Dependency>,
  path: PathBuf,
  #[allow(dead_code)]
  valid: bool,
  binary_root: PathBuf,
}

const BINARY_PATH: &'_ str = "./.bin";

fn get_root_deps<P: AsRef<Path>>(current_dir: P) -> RootDeps {
  let mut current_dir = current_dir.as_ref().to_path_buf();
  println!("current_dir: {current_dir:?}");

  loop {
    let binary_root = current_dir.join(BINARY_PATH);
    let file_path = current_dir.join("Cargo.toml");
    println!("file_path: {:?}", &file_path);
    if file_path.exists() {
      let toml = Manifest::from_path(&file_path).unwrap();

      if let Some(workspace) = toml.workspace {
        return RootDeps {
          deps: workspace.dependencies,
          path: file_path,
          binary_root,
          valid: true,
        };
      }
    }

    let binary_root = current_dir.join(BINARY_PATH);
    let file_path = current_dir.join("Cargo.toml");
    if !current_dir.pop() {
      return RootDeps {
        deps: BTreeMap::new(),
        path: file_path,
        binary_root,
        valid: false,
      };
    }
  }
}

fn get_version_from_workspace(dep_details: &Dependency) -> Option<String> {
  match dep_details {
    Dependency::Detailed(dep) => dep.version.to_owned(),
    Dependency::Simple(dep) => Some(dep.to_owned()),
    Dependency::Inherited(dep) if dep.workspace => None,
    _ => None,
  }
}

fn get_binary_details(bin_name: &str) -> Result<BinaryDetails> {
  let RootDeps {
    deps,
    path,
    binary_root: root,
    ..
  } = get_root_deps(env::current_dir()?);
  let mut installation_name = None;

  if [
    "cargo-add",
    "cargo-rm",
    "cargo-upgrade",
    "cargo-set-version",
  ]
  .contains(&bin_name)
  {
    installation_name = Some("cargo-edit".to_owned());
  }

  for (key, details) in deps.iter() {
    if let Some(installation_name) = &installation_name {
      if key != installation_name {
        continue;
      }
    } else if key != bin_name {
      continue;
    }

    let version = get_version_from_workspace(details).unwrap();

    return Ok(BinaryDetails {
      name: bin_name.to_owned(),
      version,
      root,
      installation_name,
    });
  }

  let metadata = MetadataCommand::new()
    .manifest_path(&path) // TODO Delete this my later, and find a way to autodiscover.
    .exec()?;

  let pkg = metadata
    .packages
    .iter()
    .find(|e| {
      return e.targets.iter().any(|t| {
        // println!("{:?}", &t.name);
        t.name == bin_name
      });
    })
    .ok_or_else(|| anyhow!(format!("Package for binary {bin_name} not found")))?;

  Ok(BinaryDetails {
    name: bin_name.to_owned(),
    version: pkg.version.to_string(),
    root,
    installation_name: installation_name.or(Some(pkg.name.to_owned())),
  })
}

fn run_binary(args: &Vec<String>) -> Result<()> {
  let mut args = args.to_owned();
  let binary = args[0].to_owned();
  let binary_details = get_binary_details(&binary)?;

  let env_path = match env::var("PATH") {
    Ok(val) => val,
    Err(_) => return Ok(()), // TODO throw err;
  };

  install_binaries(
    &[binary_details.clone()],
    binary_details.root.to_string_lossy(),
  )?;
  let command = binary_details
    .get_binary_path()
    .to_string_lossy()
    .to_string();

  args.drain(0..1);
  println!("Running binary {command} with args {args:?}");

  // if binary.starts_with("cargo-") {
  //   cache_bin_path = "cargo".to_owned();
  //   env_path = format!("{cache_path}/bin:{env_path}");

  //   let mut new_args = vec![binary.replace("cargo-", "")];
  //   new_args.append(&mut args);
  //   args = new_args;
  // }

  let spawn = process::Command::new(command)
    .stdout(process::Stdio::inherit())
    .stderr(process::Stdio::inherit())
    .stdin(process::Stdio::inherit())
    .env("PATH", env_path)
    .args(&args)
    .spawn();

  if let Ok(mut spawn) = spawn {
    let status = spawn
      .wait()?
      .code()
      .ok_or_else(|| anyhow!("Failed to get spawn exit code"))?;
    process::exit(status);
  }

  println!("binary_details: {:#?}", &binary_details);
  Err(anyhow!(format!(
    "Process {}@{} failed to start",
    &binary_details.name, &binary_details.version
  )))
}

fn install_binaries(details: &[BinaryDetails], root: impl AsRef<str>) -> Result<(), anyhow::Error> {
  let binaries = details
    .iter()
    .filter_map(|details| {
      if details.get_binary_path().exists() {
        println!("Binary '{}' already installed", &details.name);
        None
      } else {
        Some(format!(
          "{}@{}",
          details.get_install_name(),
          details.version
        ))
      }
    })
    .collect::<Vec<_>>()
    .join(" ");

  let jobserver_client = LazyJobserverClient::new();
  let mut args = Args::parse_from(["-y", binaries.as_str(), "--install-path", root.as_ref()]);

  args.no_confirm = true;

  let _result = run_tokio_main(install_crates(args, jobserver_client))?;
  Ok(())
}

#[non_exhaustive]
#[derive(Debug, Parser)]
#[command(
  about = "Run a local binary from the workspace",
  long_about = "Taken from `cargo-run-bin`"
)]
pub struct Bin {
  /// Whether to list all available binaries
  #[arg(short, long, default_value_t = false)]
  list: bool,

  /// Install all available binaries
  #[arg(short, long, default_value_t = false)]
  all: bool,

  /// The name and the rest of the args.
  rest: Vec<String>,
}

impl Bin {
  pub fn run(&self) {
    if self.all {
      let details = &[
        "cargo-all-features",
        "cargo-binstall",
        "cargo-edit",
        "cargo-insta",
        "cargo-make",
        "dprint",
        "trunk",
        "wasm-pack",
      ]
      // .iter()
      .map(|bin_name| get_binary_details(bin_name).unwrap());

      install_binaries(details, details[0].root.to_string_lossy()).unwrap();
    } else {
      let result = run_binary(&self.rest);

      if let Err(error) = result {
        println!("run-bin failed: {error}");
      }
    }
  }
}

#[cfg(test)]
mod test {
  use crates_io_api::SyncClient;

  #[test]
  fn try_it() {
    let client = SyncClient::new(
      "my-user-agent (my-contact@domain.com)",
      std::time::Duration::from_millis(1000),
    )
    .unwrap();

    let details = client.get_crate("cargo-edit").unwrap();
    println!("{details:#?}");
  }
}
