{ pkgs, ... }:

{
  packages = [
    pkgs.cargo-all-features
    pkgs.cargo-generate
    pkgs.cargo-insta
    pkgs.cargo-make
    pkgs.cargo-workspaces
    pkgs.cargo-edit
    pkgs.deno
    pkgs.dprint
    pkgs.fnm
    pkgs.git
    pkgs.ripgrep
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.trunk
    # pkgs.godot
  ];

  difftastic.enable = true;
  devcontainer.enable = true;


  # Scripts

  scripts."build:all".exec = ''
    cargo build
  '';
  scripts."fix:all".exec = ''
    fix:format
    fix:clippy
  '';
  scripts."fix:format".exec = ''
    dprint fmt
  '';
  scripts."fix:clippy".exec = ''
    cargo clippy --fix --allow-dirty --allow-staged
  '';
  scripts."lint:all".exec = ''
    lint:format
    lint:clippy
  '';
  scripts."lint:format".exec = ''
    dprint check
  '';
  scripts."lint:clippy".exec = ''
    cargo clippy
  '';
  scripts."test:snapshot".exec = ''
    cargo insta accept
  '';
  scripts."test:all".exec = ''
    cargo test
  '';
  scripts."setup:helix".exec = ''
    rm -rf .helix
    cp -r setup/editors/helix .helix
  '';
  scripts."setup:vscode".exec = ''
    rm -rf .vscode
    cp -r ./setup/editors/vscode .vscode
  '';
  scripts."setup:ci".exec = ''
    # update GitHub CI Path
    echo "$DEVENV_PROFILE/bin" >> $GITHUB_PATH
    echo "DEVENV_PROFILE=$DEVENV_PROFILE" >> $GITHUB_ENV

    # prepend common compilation lookup paths
    echo PKG_CONFIG_PATH=$PKG_CONFIG_PATH" >> $GITHUB_ENV
    echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> $GITHUB_ENV
    echo LIBRARY_PATH=$LIBRARY_PATH" >> $GITHUB_ENV
    echo C_INCLUDE_PATH=$C_INCLUDE_PATH" >> $GITHUB_ENV

    # these provide shell completions / default config options
    echo XDG_DATA_DIRS=$XDG_DATA_DIRS" >> $GITHUB_ENV
    echo XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS" >> $GITHUB_ENV

    echo DEVENV_DOTFILE=$DEVENV_DOTFILE" >> $GITHUB_ENV
    echo DEVENV_PROFILE=$DEVENV_PROFILE" >> $GITHUB_ENV
    echo DEVENV_ROOT=$DEVENV_ROOT" >> $GITHUB_ENV
    echo DEVENV_STATE=$DEVENV_STATE" >> $GITHUB_ENV
  '';
}
