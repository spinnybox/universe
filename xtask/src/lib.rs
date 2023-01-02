use std::env;
use std::path::Path;
use std::path::PathBuf;
use std::process;
use std::process::Command;

use anyhow::Result;
pub use bin::Bin;
pub use symlink_root::symlink_root;

/// Get the default command for the build in the dist process.
///
/// This is `cargo build --target wasm32-unknown-unknown`.
pub fn default_build_command() -> Command {
  let mut command = Command::new("cargo");
  command.args(["build", "--target", "wasm32-unknown-unknown"]);
  command
}

pub fn project_root() -> PathBuf {
  Path::new(
    &env::var("CARGO_MANIFEST_DIR").unwrap_or_else(|_| env!("CARGO_MANIFEST_DIR").to_owned()),
  )
  .ancestors()
  .nth(1)
  .unwrap()
  .to_path_buf()
}

pub fn format_files(files: Vec<String>) -> Result<()> {
  process::Command::new("cargo")
    .stdout(process::Stdio::inherit())
    .stderr(process::Stdio::inherit())
    .stdin(process::Stdio::inherit())
    .arg("fix:format")
    .args(files)
    .output()?;

  Ok(())
}

mod bin;
mod symlink_root;
pub mod utils;
