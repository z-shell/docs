- [Quick install](#quick-install)
- [Manual install](#manual-install)
- [Post-install](#post-install)

> Contribute to [this page](https://github.com/z-shell/docs/blob/main/wiki/zi/01-introduction/Installation.md)

---

## Quick install

If you prefer stable version with less changes, append `-b <tag>` e.g:

`sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip -b 0.9.9`

```zsh
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

## Manual install

Clone repository:

```zsh
zi_home="${HOME}/.zi" && command mkdir -p $zi_home
command git clone https://github.com/z-shell/zi.git "${zi_home}/bin"
```

Source `zi.zsh` from your `.zshrc`:

```zsh
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
```

## Post-install

- Run: `exec zsh` and `zi self-update`.
- Visit [wiki](https://github.com/z-shell/zi/wiki/):
  - [Introduction](https://github.com/z-shell/zi/wiki/Introduction)
  - [ZI Annex meta plugins](https://github.com/z-shell/zi/wiki/z-a-meta-plugins)
  - [Oh My Zsh integration](https://github.com/z-shell/zi/wiki/Oh-My-Zsh-setup)
  - [Gallery](https://github.com/z-shell/zi/wiki/Gallery)
