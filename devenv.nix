{ pkgs, ... }:

{
  packages = [
    pkgs.cargo-all-features
    pkgs.cargo-audit
    pkgs.cargo-udeps
    pkgs.cargo-binstall
    pkgs.cargo-edit
    pkgs.cargo-deny
    pkgs.cargo-generate
    pkgs.cargo-insta
    pkgs.cargo-make
    pkgs.cargo-watch
    pkgs.cargo-workspaces
    pkgs.deno
    pkgs.dprint
    pkgs.fnm
    pkgs.git
    pkgs.nodePackages.firebase-tools
    pkgs.nodePackages.sass
    pkgs.ripgrep
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.trunk
  ];

  difftastic.enable = true;
  devcontainer.enable = true;

  # Scripts
  scripts."leptos:watch".exec = ''
    cargo:make leptos
  '';
  scripts."leptos:build".exec = ''
    cargo:make leptos:build
  '';
  scripts."prisma:generate".exec = ''
    prisma generate --schema=./apps/spinnybox_com/prisma/schema.prisma
  '';
  scripts."prisma".exec = ''
    cargo run -p prisma_cli -- $@
  '';
  scripts."css:generate".exec = ''
    cargo:make css:generate
  '';
  scripts."css:watch".exec = ''
    cargo:make css:watch
  '';
  scripts."build:ios:debug".exec = ''
    cargo:make export-aarch64-apple-ios-debug spinnybox
  '';
  scripts."build:ios".exec = ''
    cargo:make export-aarch64-apple-ios-release spinnybox
  '';
  scripts."export:ios:debug".exec = ''
    cargo:make export-aarch64-apple-ios-debug-script spinnybox
  '';
  scripts."export:ios".exec = ''
    cargo:make export-aarch64-apple-ios-release-script spinnybox
  '';
  scripts."cargo:make".exec = ''
    cargo make $@
  '';
  scripts.leptos.exec = ''
    set -e
    PATH=$PWD/.bin/bin:$PATH
    cargo leptos $@
  '';
  scripts."build:all".exec = ''
    cargo build
  '';
  scripts."fix:all".exec = ''
    set -e
    fix:format
    # fix:clippy # this sometimes breaks things when working with feature flags
    fix:dart
  '';
  scripts."fix:format".exec = ''
    set -e
    dprint fmt
    dart format .
  '';
  scripts."fix:clippy".exec = ''
    cargo clippy --fix --allow-dirty --allow-staged
  '';
  scripts."fix:dart".exec = ''
    dart fix --apply
  '';
  scripts."lint:all".exec = ''
    set -e
    lint:format
    lint:clippy
    lint:dart
  '';
  scripts."lint:format".exec = ''
    set -e
    dprint check
    dart format -o none --set-exit-if-changed .
  '';
  scripts."lint:clippy".exec = ''
    cargo clippy
  '';
  scripts."lint:dart".exec = ''
    dart analyze
  '';
  scripts."test:snapshot".exec = ''
    cargo insta accept
  '';
  scripts."test:all".exec = ''
    cargo test
  '';
  scripts."setup:helix".exec = ''
    set -e
    rm -rf .helix
    cp -r setup/editors/helix .helix
  '';
  scripts."setup:vscode".exec = ''
    set -e
    rm -rf .vscode
    cp -r ./setup/editors/vscode .vscode
  '';
  scripts."setup:ci".exec = ''
    set -e
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
