- [Customizing Paths](#customizing-paths)
- [Non-GitHub (Local) Plugins](#non-github-local-plugins)
- [Extending Git](#extending-git)
- [Disabling System-Wide `compinit` Call (Ubuntu)](#disabling-system-wide-compinit-call-ubuntu)

> Contribute to [this page](https://github.com/z-shell/docs/blob/main/wiki/zi/01-introduction/Hints-%26-Tips.md)

---

## Customizing Paths

Following variables can be set to custom values, before sourcing ZI. The
previous global variables like `$ZPLG_HOME` have been removed to not pollute
the namespace – there's a single `$ZI` hash instead of `8` string
variables. Please update your dotfiles.

```zsh
declare -A ZI  # initial ZI's hash definition, if configuring before loading ZI, and then:
```

| Hash Field                     | Description                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ZI[BIN_DIR]                    | Where ZI code resides, e.g.: "~/.zi/bin"                                                                                                                                                                                                                                                                                                                                                            |
| ZI[HOME_DIR]                   | Where ZI should create all working directories, e.g.: "~/.zi"                                                                                                                                                                                                                                                                                                                                       |
| ZI[PLUGINS_DIR]                | Override single working directory – for plugins, e.g. "/opt/zsh/zi/plugins"                                                                                                                                                                                                                                                                                                                         |
| ZI[COMPLETIONS_DIR]            | As above, but for completion files, e.g. "/opt/zsh/zi/root_completions"                                                                                                                                                                                                                                                                                                                             |
| ZI[SNIPPETS_DIR]               | As above, but for snippets                                                                                                                                                                                                                                                                                                                                                                          |
|                                |
| ZI[ZMODULES_DIR]               | Override single working directory – for Zsh modules e.g. "/opt/zsh/zi/zmodules"                                                                                                                                                                                                                                                                                                                     |
|                                |
| ZI[ZCOMPDUMP_PATH]             | Path to `.zcompdump` file, with the file included (i.e. its name can be different)                                                                                                                                                                                                                                                                                                                  |
| ZI[COMPINIT_OPTS]              | Options for `compinit` call (i.e. done by `zicompinit`), use to pass -C to speed up loading                                                                                                                                                                                                                                                                                                         |
| ZI[MUTE_WARNINGS]              | If set to `1`, then mutes some of the ZI warnings, specifically the `plugin already registered` warning                                                                                                                                                                                                                                                                                             |
| ZI[OPTIMIZE_OUT_DISK_ACCESSES] | If set to `1`, then ZI will skip checking if a Turbo-loaded object exists on the disk. By default, ZI skips Turbo for non-existing objects (plugins or snippets) to install them before the first prompt – without any delays, during the normal processing of `zshrc`. This option can give a performance gain of about 10 ms out of 150 ms (i.e.: Zsh will start-up in 140 ms instead of 150 ms). |

There is also `$ZPFX`, set by default to `~/.zi/polaris` – a directory
where software with `Makefile`, etc. can be pointed to, by e.g. `atclone'./configure --prefix=$ZPFX'`.

## Non-GitHub (Local) Plugins

Use `create` subcommand with user name `_local` (the default) to create the plugin's
skeleton in `$ZI[PLUGINS_DIR]`. It will be not connected with the GitHub repository
(because of the user name being `_local`). To enter the plugin's directory use the `cd` command
with just the plugin's name (without `_local`, it's optional).

If the user name will not be `_local`, then ZI will create a repository also on GitHub
and set up the correct repository origin.

## Extending Git

Several projects provide git extensions. Installing them with ZI has many benefits:

- all files are under `$HOME` – no administrator rights needed,
- declarative setup (like Chef or Puppet) – copying `.zshrc` to a different account
  brings also git-related setup,
- easy update by e.g. `zi update --all`.

Below is a configuration that adds multiple git extensions, loaded in Turbo mode,
1 second after prompt, with use of the
[Bin-Gem-Node](https://github.com/z-shell/z-a-bin-gem-node) annex:

```zsh
zi as"null" wait"1" lucid for \
    sbin    Fakerr/git-recall \
    sbin    cloneopts paulirish/git-open \
    sbin    paulirish/git-recent \
    sbin    davidosomething/git-my \
    sbin atload"export _MENU_THEME=legacy" \
            arzzen/git-quick-stats \
    sbin    iwata/git-now \
    make"PREFIX=$ZPFX install" \
            tj/git-extras \
    sbin"bin/git-dsf;bin/diff-so-fancy" \
            z-shell/zsh-diff-so-fancy \
    sbin"git-url;git-guclone" make"GITURL_NO_CGITURL=1" \
            z-shell/git-url
```

The target directory for installed files is `$ZPFX` (`~/.zi/polaris` by default).

## Disabling System-Wide `compinit` Call (Ubuntu)

On Ubuntu users might get surprised that e.g. their completions work while they didn't
call `compinit` in their `.zshrc`. That's because the function is being called in `/etc/zshrc`.
To disable this call – what is needed to avoid the slowdown and if the user loads
any completion-equipped plugins, i.e. almost on 100% – add the following lines to `~/.zshenv`:

```zsh
# Skip the not helping Ubuntu global compinit
skip_global_compinit=1
```
