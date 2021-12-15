- Meta plugins have the curated, optimal ice lists automatically applied.
- It's possible to create our own group of plugins by opening a new issue on [annexes](https://github.com/z-shell/z-annexes) repository. All plugins can be installed with a single command line in your .zshrc file.

**Notes:**

- Before using meta plugins, a meta-plugins annex have to be installed. (`zi light-mode for z-a-meta-plugins`)
- Prefix `@` used to avoid syntax conflicts. Example: `zi light-mode for @<meta-group-name>`

It can be tiring to:

- Constantly, over and over collect some new interesting plugins to install/load.
- Over and over reconstruct the new findings on the new machines.
- Constantly extend and tweak the ice list of each plugin, so that it's hard on
  the eyes, especially for an outsider.

---

## Meta Plugins Annex basics

|                          Problem                           | Solution                                                                                                                                                                                                                                                                           |
| :--------------------------------------------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|               (1)<br/> _finding new plugins_               | the annex contains a curated, broad list of plugins, e.g.: all the console tools like `fd`, `fzf`, `exa`, `ripgrep`, etc.,                                                                                                                                                         |
| (2)<br/> _reconstructing the findings in new environments_ | it's easy to say and memorize e.g.: `zi for console-tools` – one label pulls a group of plugins and also the curated, optimal, default ice lists for each of them,                                                                                                                 |
| (3)<br/> _constant increase of complexity of the commands_ | the provided, hopefully, best/optimal ices for each plugin are handled transparently and automatically; care is given to each ice list so that the plugin loads without any glitches (e.g.: without "No files for compilation found." message and other, even such slight issues). |

Other unique benefits of the Meta-Plugins annex:

|                           Benefit                           | Description                                                                                                                                                                                                                                                                                                     |
| :---------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                     plugin dependencies                     | The meta-plugins implement a dependency mechanism (to some extent), so that e.g.: selecting a from-source built [ogham/exa](https://github.com/ogham/exa) will automatically pull-in also the Rust compiler (available under meta-plugin name: `rust-toolchain`).                                               |
| flexible disabling of chosen sub-plugins in any meta-plugin | A meta-plugin can contain many sub-plugins and it's possible to skip installing some of them by the **skip'plg-1 plg-2…'** ice, e.g.: `zi skip'ripgrep fd' for console-tools`. This way despite that some of the meta-plugins are broad the user still has control over what's and how much is being installed. |
|               common from-source meta-plugins               | For the plugins that provide the binary programs it is often the case that a meta-plugin exists that'll build the program from source (e.g.: **fuzzy** meta-plugin and its **fuzzy-src** counterpart). This might be handy e.g.: if there's no binary for our machine.                                          |

## The list of the currently available meta-plugin groups

### Annexes

> Consisting of: 1) [z-shell/z-a-unscope](https://github.com/z-shell/z-a-unscope), 2) [z-shell/z-a-readurl](https://github.com/z-shell/z-a-readurl), 3) [z-shell/z-a-patch-dl](https://github.com/z-shell/z-a-patch-dl), 4) [z-shell/z-a-rust](https://github.com/z-shell/z-a-rust), 5) [z-shell/z-a-submods](https://github.com/z-shell/z-a-submods), 6) [z-shell/z-a-bin-gem-node](https://github.com/z-shell/z-a-bin-gem-node).

```zsh
zi light-mode for @annexes
```

### Annexes + Console

> Consisting of: 1) [z-shell/zi-console](https://github.com/z-shell/zi-console), 2) [z-shell/z-a-unscope](https://github.com/z-shell/z-a-unscope), 3) [z-shell/z-a-readurl](https://github.com/z-shell/z-a-readurl), 4) [z-shell/z-a-patch-dl](https://github.com/z-shell/z-a-patch-dl), 5) [z-shell/z-a-rust](https://github.com/z-shell/z-a-rust), 6) [z-shell/z-a-submods](https://github.com/z-shell/z-a-submods), 7) [z-shell/z-a-bin-gem-node](https://github.com/z-shell/z-a-bin-gem-node).

```zsh
zi light-mode for @annexes+con
```

### Zsh-users

> Consisting of: 1) [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), 2) [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), 3) [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions).

```zsh
zi light-mode for @zsh-users
```

### Zsh-users + Fast syntax

> Consisting of: 1) [z-shell/F-Sy-H](https://github.com/z-shell/F-Sy-H), 2) [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), 3) [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions).

```zsh
zi light-mode for @zsh-users+fast
```

### Z-Shell

> Consisting of: 1) [z-shell/F-Sy-H](https://github.com/z-shell/F-Sy-H), 2) [z-shell/H-S-MW](https://github.com/z-shell/H-S-MW), 3) [z-shell/zsh-diff-so-fancy](https://github.com/z-shell/zsh-diff-so-fancy).

```zsh
zi light-mode for @z-shell
```

### Z-Shell secondary

> Consisting of: 1) [z-shell/zconvey](https://github.com/z-shell/zconvey), 2) [z-shell/zui](https://github.com/z-shell/zui), 3) [z-shell/zflai](https://github.com/z-shell/zflai).

```zsh
zi light-mode for @z-shell2
```

### Molovo

> Consisting of: 1) [molovo/color](https://github.com/molovo/color), [molovo/revolver](https://github.com/molovo/revolver), [molovo/zunit](https://github.com/molovo/zunit).

```zsh
zi light-mode for @molovo
```

### Romkatv

> Consisting of: 1) [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k).

```zsh
zi light-mode for @romkatv
```

### Sharkdp

> Consisting of: 1) [sharkdp/fd](https://github.com/sharkdp/fd), 2) [sharkdp/bat](https://github.com/sharkdp/bat), 3) [sharkdp/hexyl](https://github.com/sharkdp/hexyl), 4) [sharkdp/hyperfine](https://github.com/sharkdp/hyperfine), 5) [sharkdp/vivid](https://github.com/sharkdp/vivid).

```zsh
zi light-mode for @sharkdp
```

### Console tools

> Consisting of: 1) [dircolors-material](https://github.com/z-shell/dircolors-material) (**package**), 2) [sharkdp/fd](https://github.com/sharkdp/fd), 3) [sharkdp/bat](https://github.com/sharkdp/bat), 4) [sharkdp/hexyl](https://github.com/sharkdp/hexyl), 5) [sharkdp/hyperfine](https://github.com/sharkdp/hyperfine), 6) [sharkdp/vivid](https://github.com/sharkdp/vivid) , 7) [ogham/exa](https://github.com/ogham/exa), 8) [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep), 9) [jonas/tig](https://github.com/jonas/tig)

```zsh
zi light-mode for @console-tools
```

### Fuzzy

> Consisting of: 1) [fzf](https://github.com/z-shell/fzf) (**package**), 2) [fzy](https://github.com/z-shell/fzy) (**package**), 3) [lotabout/skim](https://github.com/lotabout/skim), 4) [peco/peco](https://github.com/peco/peco)

```zsh
zi light-mode for @fuzzy
```

### Fuzzy Source

> Consisting of: 1) fzf-go, 2) [fzy](https://github.com/z-shell/fzy), 3) skim-cargo, 4) peco-go.

```zsh
zi light-mode for @fuzzy-src
```

### Extentend Git

> Consisting of: 1) [paulirish/git-open](https://github.com/paulirish/git-open), 2) [paulirish/git-recent](https://github.com/paulirish/git-recent), 3) [davidosomething/git-my](https://github.com/davidosomething/git-my), 4) [arzzen/git-quick-stats](https://github.com/arzzen/git-quick-stats), 5) [iwata/git-now](https://github.com/iwata/git-now), 6) [tj/git-extras](https://github.com/tj/git-extras), 7) [wfxr/forgit](https://github.com/wfxr/forgit).

```zsh
zi light-mode for @rust-utils
```

### Rust utilities

> Consisting of: 1) rust-toolchain, 2) cargo-extensions.

```zsh
zi light-mode for @rust-utils
```

### Prezto

> Consisting of: 1) PZTM::archive, 2) PZTM::directory, 3) PZTM::utility.

```zsh
zi light-mode for @prezto
```

### Combine multiple groups

```zsh
zi light-mode for z-shell/z-a-meta-plugins \
    @annexes @console-tools \
    @zsh-users+fast @ext-git
```

### Install example of 22 plugins

```zsh
# Installs a total of 22 plugins
zi for @annexes @zsh-users+fast @console-tools @fuzzy
```

#### Not fully supported yet:

| **developer** | [github-issues](https://github.com/z-shell/github-issues) (**package**), [github-issues-srv](https://github.com/z-shell/github-issues-srv) (**package**), [molovo/color](https://github.com/molovo/color), [molovo/revolver](https://github.com/molovo/revolver), [molovo/zunit](https://github.com/molovo/zunit), [voronkovich/gitignore](https://github.com/voronkovich/gitignore.plugin.zsh), [jonas/tig](https://github.com/jonas/tig)

![screenshot](https://raw.githubusercontent.com/z-shell/z-a-meta-plugins/main/images/fuzzy-mplg-ex.png)
