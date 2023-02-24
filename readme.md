# spinnybox

> a different kind of box

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

## Planning

There are three parts to the mvp

- [ ] The 2d game
  - [x] build on `iOS`
  - [-] ~~build on android~~
  - [ ] Support rotation tracking on `iOS`
    - [ ] Port from previous flutter application
  - [ ] Simplest game possible with a basic character
    - [ ] Rotate to dodge obstacles
    - [ ] Obstactles are randomly generated and more are generated the longer you play
  - [ ] The game ui
    - [ ] egui rendering to avoid godot boilerplate
    - [ ] add handrawn ui
  - [ ] Characters
    - [ ] pngs for each part of the character
    - [ ] dynamic character creation in game
- [ ] The fundraising platform
  - [ ] Port over fundraising contract
  - [ ] Add rust library ui code via `anchor-gen`
    - [ ] Might have to fork and upgrade
  - [ ] Write one library test
  - [ ] Integrate with raising funds via nfts (compressed)
- [ ] The website
  - [ ] implement design with tailwind and leptos
  - [ ] implement dark mode
  - [ ] support authentication via glow and phantom
  - [ ] integrate fundraising platform ui
