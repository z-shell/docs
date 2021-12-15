- [`LS_COLORS`](#ls_colors)
- [`direnv`](#direnv)

---

## `LS_COLORS`

A repository [**trapd00r/LS_COLORS**](https://github.com/trapd00r/LS_COLORS)
provides a file with color definitions for GNU `ls` command (and also for
[**ogham/exa**](https://github.com/ogham/exa); it can be also used to style Zsh
completion – more on this below). Typically one does `eval $( dircolors -b $HOME/LS_COLORS)` to process this file and set environment for `ls`. However
this means `dircolors` is ran every shell startup.

This costs much time, because a fork has to be done and the program (i.e.
`dircolors`) binary needs to be loaded and executed, and because `dircolors`
loads the colors' definitions and processes them. Following ZI invocation
solves this problem:

```zsh
zi ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zi light trapd00r/LS_COLORS
```

- `atclone"…"` – generate shell script, but instead of passing it to `eval`,
  save it to file,
- `atpull'%atclone'` – do the same at any update of plugin (the `atclone` is
  being ran on the _installation_ while the `atpull` hook is being ran on an
  _update_ of the
  [**trapd00r/LS_COLORS**](https://github.com/trapd00r/LS_COLORS) plugin); the
  `%atclone` is just a special string that denotes that the `atclone''` hook
  should be copied onto the `atpull''` hook,
- `pick"clrs.zsh"` – source file `clrs.zsh`, the one that is generated,
- `nocompile'!'` – invokes compilation **after** the `atclone''` ice-mod (the
  exclamation mark causes this).
- `atload"…"` – additionally sets up the Zsh completion to use the colors
  provided by the trapd00r package.

This way, except for the plugin installation and update, `dircolors` isn't ran,
just normal sourcing is done. The every-day sourced file (i.e. `clrs.zsh`) is even
being compiled to speed up the loading.

## `direnv`

The project [**direnv/direnv**](https://github.com/direnv/direnv) registers
itself in Zshell to modify environment on directory change. This registration is
most often done by `eval "$(direnv hook zsh)"` added to zshrc.

Drawback of this standard procedure is that `direnv` binary is ran on every
shell startup and significantly slows it down. ZI allows to solve this in
following way:

```zsh
zi as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' pick"direnv" src"zhook.zsh" for \
  direnv/direnv
```

- `make'!'` – compile `direnv` (it's written in Go lang); the exclamation mark
  means: run the `make` first, before `atclone` and `atpull` hooks,
- `atclone'…'` – initially (right after installing the plugin) generate the
  registration code and save it to `zhook.zsh` (instead of passing to `eval`),
- `atpull'%atclone'` – regenerate the registration code also on update
  (`atclone''` runs on _installation_ while `atpull` runs on _update_ of the
  plugin),
- `src"zhook.zsh"` – load (`source`) the generated registration code,
- `pick"direnv"` – ensure `+x` permission on the binary,
- `as"program"` – the plugin is a program, there's no main file to source.

This way registration code is generated once every installation and update, to then be simply sourced without running `direnv`.

The project is also available as binary Github release. This distribution can be installed by:

```zsh
zi from"gh-r" as"program" mv"direnv* -> direnv" \
  atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
  pick"direnv" src="zhook.zsh" for \
  direnv/direnv
```

- `from"gh-r"` – install from Github **releases**,
- `mv"…"` – after installation, rename `direnv.linux-386` or similar file to
  `direnv`,
- `atclone'…'`, `atpull'…'` – as in previous example,
- `pick"direnv"` – as in previous example,
- `as"program"` – as in previous example.
