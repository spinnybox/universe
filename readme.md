<p align="center">
  <a href="https://spinnybox.com"><img width="300" height="300" src="games/2d/assets/svg/rounded_logo.svg" alt="Spinny Box Logo" /></a>
</p>

<br />

<p align="center">
  <a href="#introduction"><strong>Introduction</strong></a> ·
  <a href="https://spinnybox.com"><strong>Website</strong></a> ·
  <a href="https://preview.spinnybox.com"><strong>Preview Website</strong></a> ·
  <a href="https://spinnybox.com/download"><strong>Download</strong></a>
</p>

<br />

<p align="center">
  <strong>Unconventional</strong> <em>games</em> for <strong>everyone</strong>.
</p>

<br />

<p align="center">
  <a href="https://github.com/spinnybox/universe/actions?query=workflow:ci">
    <img src="https://github.com/spinnybox/universe/workflows/ci/badge.svg?branch=main" title="Main CI Action" />
  </a>
  <a href="https://github.com/spinnybox/universe/actions?query=workflow:ci">
    <img src="https://api.codemagic.io/apps/63ff0ff9a3a9ec94eed2478d/63ff0ff9a3a9ec94eed2478c/status_badge.svg" title="CodeMagic Build Status" />
  </a>

</p>

<br />

## Why?

The idea for Spinny Box came while I was pacing around my room with my phone in hand. As someone with _ADHD_, I am constantly fidgeting. On this particular day, I was absent-mindedly throwing my phone up and down.

Feeling like I was wasting time, a thought came to me. "Wouldn't it be cool if I could be rewarded for this?"

And that's where the idea came to me. Use fidgeting as a means to unlock different methods of play on our devices.

This project will release a series of unconventional games that seek to reward the inner child.

I hope it fulfils my initial vision, and I hope you enjoy it!

<br />

## Contributing

First make sure to [install `flutter`](https://docs.flutter.dev/get-started/install) since it doesn't work on `macos` with `nix` yet.

[`devenv`](https://devenv.sh/) is used to provide a reproducible development environment for this project. Follow the [getting started instructions](https://devenv.sh/getting-started/).

The installation will be easier if you are using `nix flakes`. On `macos` and `linux` you can run the following command.

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

To automatically load the environment you should [install direnv](https://devenv.sh/automatic-shell-activation/) and then load the `direnv`.

```bash
direnv allow .
```

At this point you should see the `nix` commands available in your terminal.

### Upgrading `devenv`

If you have an outdated version of `devenv` you can update it by running the following commands. If you have an easier way, please create a PR and I'll update these docs.

```bash
nix profile list # find the index of the nxi package
nix profile remove <index>
nix profile install --accept-flake-config github:cachix/devenv/<version>
```

### Editor Setup

To setup recommended configuration for your favourite editor run the following commands.

```bash
setup:vscode # Setup vscode
setup:helix  # Setup helix configuration
```
