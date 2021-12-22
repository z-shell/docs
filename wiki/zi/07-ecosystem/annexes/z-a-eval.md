Author: [NICHOLAS85](https://gihub.com/NICHOLAS85)

---

An Annex (i.e. an extension) that provides additional functionality, which allows to:

1. Cache the output of arbitrarily slow initialization command to speed up shell startup time.

## Installation

Simply load like a regular plugin, i.e.:

```zsh
zi light NICHOLAS85/z-a-eval
```

After executing this command you can then use the new ice-mods provided by
the annex.

## How it works

The output of a slow initialization command is redirected to a file located within the plugin/snippets directory and sourced while loading. The next time the plugin/snippet is loaded, this file will be sourced skipping the need to run the initialization command.

## Ice Modifiers Provided By The Annex

There is 1 ice-modifier provided and handled by this annex. They are:

1. `eval''` – creates a `cache` containing the output of a command.

**The ice-modifier in detail:**

---

### 1. **`eval'[!]{command}…'`**

It creates a `cache` in the plugin/snippets root directory which stores the commands output. This cache is regenerated when:

- The plugin/snippet is updated.
- The cache file is removed.
- With the new ZI subcommand `recache`.

The optional preceding `!` flag means to store command output regardless of exit code. Otherwise `eval''` will avoid caching ouput of code which returns a non-zero exit code.

## Example Invocations

```zsh
## Without z-a-eval
zi ice as"command" from"gh-r" mv"zoxide* -> zoxide"  \
      atclone"./zoxide init zsh > init.zsh"  atpull"%atclone" src"init.zsh" nocompile'!'
zi light ajeetdsouza/zoxide

## With z-a-eval
zi ice as"command" from"gh-r" mv"zoxide* -> zoxide" \
      eval"./zoxide init zsh"
zi light ajeetdsouza/zoxide
```

```zsh
## Without z-a-eval
zi ice atclone"dircolors -b LS_COLORS > init.zsh" \
    atpull"%atclone" pick"init.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zi light trapd00r/LS_COLORS

## With z-a-eval
zi ice eval"dircolors -b LS_COLORS" \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zi light trapd00r/LS_COLORS
```

```zsh
## Without ZI
if [[ "${+commands[kubectl]}" == 1 ]]; then
    eval $(kubectl completion zsh)
fi

## With ZI and z-a-eval
## Updated during `zi update`
zi ice id-as"kubectl_completion" has"kubectl" \
      eval"kubectl completion zsh" run-atpull
zi light zdharma/null
```

See https://github.com/NICHOLAS85/z-a-eval/issues/2#issuecomment-793374468 for more examples.

# Additional ZI commands

There's an additional ZI command that's provided by this annex
–`recache`. It recaches all your plugins/snippets eval outputs on demand. Useful for when you change the value of the `eval''` ice but do not want to redownload the plugin/snippet to update its ices, or rm the cache manually:

![recache-invocation](https://raw.githubusercontent.com/z-shell/z-a-eval/main/images/recache.png)

Available options are:

```zsh
zi recache [plugin/snippet]
```

When run without an argument, it will iterate through all plugin/snippets who have caches and regenerate them based on the current value of `eval''`. If `eval''` is missing, it will simply delete the cache file.

When run with a plugin/snippet argument, it will only regenerate that single plugin/snippets cache based on the current value of `eval''`.

# ZI tab completion support

ZI currently does not support extending the subcommands available via tab completion. I however, have implemented experimental support for this which should be duplicable across any annex.

In order to enable tab completion for the new subcommand set the value `Z_A_USECOMP=1` somewhere **before** loading this plugin. For example:

```zsh
zi atinit'Z_A_USECOMP=1' light-mode for NICHOLAS85/z-a-eval
```

If you're interested in seeing how it works some more detail can be seen at the bottom of `z-a-eval.plugin.zsh`. I'd love to hear feedback on its implementation.
