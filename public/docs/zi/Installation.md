---
sidebar_position: 1
---

## Quick install

```shell
# Will add minimal configuration
sh -c "$(curl -fsSL https://git.io/get-zi)" --

# Non interactive. Just clone or update repository.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip

# Minimal configuration + annexes.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a annex

# Minimal configuration + annexes + zunit.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a zunit

# Minimal configuration with loader
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a loader

# Suggest your .zshrc configuration to:
# https://github.com/z-shell/playground
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a ???
```

### Manual install

Clone repository:

```shell
zi_home="${HOME}/.zi" && command mkdir -p $zi_home
command git clone https://github.com/z-shell/zi.git "${zi_home}/bin"
```

Source `zi.zsh` from your `.zshrc`:

```shell
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
```

### Post-install

- Run: `exec zsh` and `zi self-update`.
- Visit [wiki](https://github.com/z-shell/zi/wiki/):
  - [Introduction](https://github.com/z-shell/zi/wiki/Introduction)
  - [ZI Annex meta plugins](https://github.com/z-shell/zi/wiki/z-a-meta-plugins)
  - [Oh My Zsh integration](https://github.com/z-shell/zi/wiki/Oh-My-Zsh-setup)
  - [Gallery](https://github.com/z-shell/zi/wiki/Gallery)
