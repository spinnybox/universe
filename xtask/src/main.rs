use std::fs;
use std::path::PathBuf;

use anyhow::Result;
use clap::Parser;
use xtask::symlink_root;
use xtask::Bin;

#[derive(Parser)]
struct Options {
  /// Set the log level to use
  #[arg(long = "log", default_value = "Info")]
  log_level: log::LevelFilter,
  #[command(subcommand)]
  cmd: Command,
}

#[derive(Parser)]
struct Build {
  /// Optimize the generated package using `wasm-opt`.
  #[arg(long)]
  optimize: bool,
}

#[derive(Parser)]
enum Command {
  Bin(Bin),
  /// Symlink the project and install all binaries.
  Setup,

  /// Generate the prisma client
  Prisma,
}

fn main() -> Result<()> {
  let root = fs::canonicalize(PathBuf::from("./"))?;

  let options: Options = Parser::parse();

  env_logger::builder()
    .filter(Some("xtask"), options.log_level)
    .init();

  match options.cmd {
    Command::Prisma => {
      // prisma_client_rust_cli::run();
    }

    Command::Setup => {
      symlink_root(root.join("xtask"))?;
    }

    Command::Bin(bin) => {
      bin.run();
    }
  }

  Ok(())
}
