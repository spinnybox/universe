<p align="center">
  <a href="https://spinnybox.com"><img width="300" height="300" src="./apps/spinnybox/assets/svg/logo.svg" alt="Spinny Box Logo" /></a>
</p>

<p align="center">
  <a href="#introduction"><strong>Introduction</strong></a> ·
  <a href="https://spinnybox.com"><strong>Website</strong></a> ·
  <a href="https://preview.spinnybox.com"><strong>Preview Website</strong></a> ·
  <a href="https://spinnybox.com/download"><strong>Download</strong></a>
</p>

<p align="center">
  <strong>Unconventional</strong> <em>games</em> for everyone.
</p>

<p align="center">
<a href="https://github.com/kickjump/spinnybox/actions?query=workflow:ci">
    <img src="https://github.com/kickjump/spinnybox/workflows/ci/badge.svg?branch=main" alt="Badge for managing automatic uploading of the fonts" title="Main CI Action" />
  </a>
</p>

<br />

## Introduction

The idea for SpinnyBox came while I was pacing around my room with my phone in hand. As someone with ADHD, I am constantly fidgeting. On this particular day, I was absent-mindedly throwing my phone up and down.

Feeling like I was wasting time, a thought came to me. "Wouldn't it be cool if I could be rewarded for this?"

And that's where the idea started, as a means to unlock different methods of play on your devices.

This project will release a series of unconventional games that seek to reward the inner child.

I hope it fulfils my initial vision, and I hope you enjoy it!

## Contributing

[`devenv`](https://devenv.sh/) is used to provide a reproducible development environment for this
project. Follow the [getting started instructions](https://devenv.sh/getting-started/).

To automatically load the environment you should
[install direnv](https://devenv.sh/automatic-shell-activation/) and then load the `direnv`.

```bash
# The security mechanism didn't allow to load the `.envrc`.
# Since we trust it, let's allow it execution.
direnv allow .
```

At this point you should see the `nix` commands available in your terminal.

To setup recommended configuration for your favourite editor run the following commands.

```bash
setup:vscode # Setup vscode
setup:helix  # Setup helix configuration
```

