### Author: [NICHOLAS85](https://github.com/NICHOLAS85)

### **Wiki:** [z-a-linkbin](https://github.com/z-shell/zi/wiki/z-a-linkbin)

## Introduction

A Zsh ZI annex (i.e. an extension) that provides functionality, which allows to:

1. Run programs and scripts without adding anything to `$PATH` via the automatic creation of **links** in `$ZPFX/bin`

## Installation

Simply load like a regular plugin, i.e.:

```zsh
zi light z-shell/z-a-linkbin
```

After executing this command you can then use the new ice-mods provided by
the annex.

## How it works

Exposing a binary program without modifying `$PATH` – `z-a-linkbin` will
automatically create a hard or soft link to the binary in `$ZPFX/bin`
exposing the program to the command line as if it were being placed in `$PATH`.

The command can then be accessed normally – not only in the live
Zsh session, but also from any Zsh script.

## The Ice Modifiers Provided By The Annex

There is 1 ice-modifier provided and handled by this annex. They are:

1. `lbin''` – creates `links` for binaries and scripts.

**The ice-modifier in detail:**

---

## 1. **`lbin'[!]{path-to-binary}[ -> {name-of-the-script}]; …'`**

It creates the `link` that calls the actual binary. The link is
created always under the same, standard and single `$PATH` entry:
`$ZPFX/bin` (which is `~/.zi/polaris/bin` by default).

The optional preceding `!` flag means create a soft link instead of a hard link.

Example:

```zsh
% zi ice from"gh-r" lbin"!fzf"
% zi load junegunn/fzf-bin
…installation messages…
% ls -l $ZPFX/bin/ | awk '{print $(NF-2),$(NF-1),$NF}'
fzf -> /home/sg/.zi/plugins/junegunn---fzf-bin/fzf
% fzf --version
0.23.1 (fc7630a)
```

**The ice can contain globs**. It will expand these when searching for the binary.

Example:

```zsh
% zi ice from"gh-r" lbin"**fzf -> myfzf"
% zi load junegunn/fzf-bin
…installation messages…
% ls $ZPFX/bin/
myfzf
% myfzf --version
0.23.1 (fc7630a)
```

**The ice can be empty**. It will then try to create the link for:

- trailing component of the `id_as` ice, e.g.: `id_as'exts/git-my'` → it'll
  check if a file `git-my` exists and if yes, create the link `git-my`,
- the plugin name, e.g.: for `paulirish/git-open` it'll check if a file
  `git-open` exists and if yes, create the link `git-open`,
- trailing component of the snippet URL,
- for any alphabetically first executable file.

Above also applies if just `!` were passed.
