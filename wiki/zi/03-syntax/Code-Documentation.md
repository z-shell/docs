[![Code Documentation](https://github.com/z-shell/docs/actions/workflows/code.yml/badge.svg)](https://github.com/z-shell/docs/actions/workflows/code.yml)

- There are `5` ZI's source files, the main one is [`zi.zsh`](https://github.com/z-shell/zi/blob/main/zi.zsh).
- The documentation lists all functions, interactions between them, their comments, and features used.

  - [`zi.zsh`](https://github.com/z-shell/zi/blob/main/zi.zsh) | Always loaded, in `.zshrc`
  - [`side.zsh`](https://github.com/z-shell/zi/blob/main/lib/zsh/side.zsh) | Functions, loaded by `*install` and `*autoload` scripts
  - [`install.zsh`](https://github.com/z-shell/zi/blob/main/lib/zsh/install.zsh) | Functions used only when installing a plugin or snippet
  - [`autoload.zsh`](https://github.com/z-shell/zi/blob/main/lib/zsh/autoload.zsh) | Functions used only in interactive `ZI` invocations
  - [`additional.zsh`](https://github.com/z-shell/zi/blob/main/lib/zsh/additional.zsh) | Support functions for additional extensions.

- Changes in the code automatically updated every `Thursday 4:30 UTC` and can be viewed at [docs](https://github.com/z-shell/docs) repository:
  - [Asciidoc](https://github.com/z-shell/docs/tree/main/code/zsdoc/asciidoc)
  - [PDF](https://github.com/z-shell/docs/tree/main/code/zsdoc/pdf)
  - [HTML](https://github.com/z-shell/docs/tree/main/code/zsdoc/html)

+++
