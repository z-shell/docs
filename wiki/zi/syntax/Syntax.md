**Related:**

- [zi-vim-syntax](https://github.com/z-shell/zi-vim-syntax)

The [Introduction](Introduction/) covers the classic ZI invocation
syntax, which is:

```zsh
zi ice …
zi load … # or zi light, zi snippet
```

It is a fundamental ZI syntax. However, a more concise, optimized syntax,
called _for-syntax_, is also available. It is best presented by a real-world
example:

```zsh
zi as"null" wait"3" lucid for \
  sbin Fakerr/git-recall \
  sbin paulirish/git-open \
  sbin paulirish/git-recent \
  sbin davidosomething/git-my \
  make"PREFIX=$ZPFX install" iwata/git-now \
  make"PREFIX=$ZPFX" tj/git-extras
```

Above single command installs 6 plugins (Git extension packages), with the base
ices `as"null" wait"3" lucid` that are common to all of the plugins and
6 plugin-specific add-on ices.

## Ice Modifiers

Following `ice` modifiers are to be
[passed](https://github.com/z-shell/zi/wiki/Alternate-Ice-Syntax/) to `zi ice ...` to
obtain described effects. The word `ice` means something that's added (like ice to a
drink) – and in ZI it means adding a modifier to a next `zi` command, and also
something that's temporary because it melts – and this means that the modification will
last only for a **single** next `zi` command.

Some Ice-modifiers are highlighted and clicking on them will take you to the
appropriate Wiki page for an extended explanation.

You may safely assume given ice works with both plugins and snippets unless
explicitly stated otherwise.

<details>
<summary> Cloning options </summary>

|                                Modifier                                | Description                                                                                                                                                                                                                                                                                                                                                                 |
| :--------------------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                `proto`                                 | <div align="justify" style="text-align: justify;">Change protocol to `git`,`ftp`,`ftps`,`ssh`, `rsync`, etc. Default is `https`. **Does not work with snippets.** </div>                                                                                                                                                                                                    |
| [**`from`**](https://github.com/z-shell/zi/wiki/Private-Repositories/) | <div align="justify" style="text-align: justify;">Clone plugin from given site. Supported are `from"github"` (default), `..."github-rel"`, `..."gitlab"`, `..."bitbucket"`, `..."notabug"` (short names: `gh`, `gh-r`, `gl`, `bb`, `nb`). Can also be a full domain name (e.g. for GitHub enterprise). **Does not work with snippets.**</div>                               |
|                                 `ver`                                  | <div align="justify" style="text-align: justify;">Used with `from"gh-r"` (i.e. downloading a binary release, e.g. for use with `as"program"`) – selects which version to download. Default is latest, can also be explicitly `ver"latest"`. Works also with regular plugins, checkouts e.g. `ver"abranch"`, i.e. a specific version. **Does not work with snippets.**</div> |
|                                `bpick`                                 | <div align="justify" style="text-align: justify;">Used to select which release from GitHub Releases to download, e.g. `zi ice from"gh-r" as"program" bpick"*Darwin*"; zi load docker/compose`. **Does not work with snippets.** </div>                                                                                                                                      |
|                                `depth`                                 | <div align="justify" style="text-align: justify;">Pass `--depth` to `git`, i.e. limit how much of history to download. **Does not work with snippets.**</div>                                                                                                                                                                                                               |
|                              `cloneopts`                               | <div align="justify" style="text-align: justify;">Pass the contents of `cloneopts` to `git clone`. Defaults to `--recursive`. I.e.: change cloning options. Pass empty ice to disable recursive cloning. **Does not work with snippets.** </div>                                                                                                                            |
|                               `pullopts`                               | <div align="justify" style="text-align: justify;">Pass the contents of `pullopts` to `git pull` used when updating plugins. **Does not work with snippets.** </div>                                                                                                                                                                                                         |
|                                 `svn`                                  | <div align="justify" style="text-align: justify;">Use Subversion for downloading snippet. GitHub supports `SVN` protocol, this allows to clone subdirectories as snippets, e.g. `zi ice svn; zi snippet OMZP::git`. Other ice `pick` can be used to select file to source (default are: `*.plugin.zsh`, `init.zsh`, `*.zsh-theme`). **Does not work with plugins.**</div>   |

</details>

<details>
<summary> Selection of Files (To Source, …) </summary>

|                                   Modifier                                   | Description                                                                                                                                                                                                                                                                                  |
| :--------------------------------------------------------------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  [**`pick`**](https://github.com/z-shell/zi/wiki/Sourcing-multiple-files/)   | <div align="justify" style="text-align: justify;">Select the file to source, or the file to set as command (when using `snippet --command` or the ice `as"program"`); it is a pattern, alphabetically first matched file is being chosen; e.g. `zi ice pick"*.plugin.zsh"; zi load …`.</div> |
|   [**`src`**](https://github.com/z-shell/zi/wiki/Sourcing-multiple-files)    | <div align="justify" style="text-align: justify;">Specify additional file to source after sourcing main file or after setting up command (via `as"program"`). It is not a pattern but a plain file name.</div>                                                                               |
| [**`multisrc`**](https://github.com/z-shell/zi/wiki/Sourcing-multiple-files) | <div align="justify" style="text-align: justify;">Allows to specify multiple files for sourcing, enumerated with spaces as the separators (e.g. `multisrc'misc.zsh grep.zsh'`) and also using brace-expansion syntax (e.g. `multisrc'{misc,grep}.zsh'`). Supports patterns.</div>            |

</details>

<details>
<summary> Conditional Loading </summary>

|                                 Modifier                                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                      |
| :----------------------------------------------------------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**`wait`**](https://github.com/z-shell/zi/wiki/Example-wait-conditions) | <div align="justify" style="text-align: justify;">Postpone loading a plugin or snippet. For `wait'1'`, loading is done `1` second after prompt. For `wait'[[ ... ]]'`, `wait'(( ... ))'`, loading is done when given condition is meet. For `wait'!...'`, prompt is reset after load. Zsh can start 80% (i.e.: 5x) faster thanks to postponed loading. **Fact:** when `wait` is used without value, it works as `wait'0'`.</div> |
|    [**`load`**](https://github.com/z-shell/zi/wiki/Multiple-prompts)     | <div align="justify" style="text-align: justify;">A condition to check which should cause plugin to load. It will load once, the condition can be still true, but will not trigger second load (unless plugin is unloaded earlier, see `unload` below). E.g.: `load'[[ $PWD = */github* ]]'`.</div>                                                                                                                              |
|   [**`unload`**](https://github.com/z-shell/zi/wiki/Multiple-prompts)    | <div align="justify" style="text-align: justify;">A condition to check causing plugin to unload. It will unload once, then only if loaded again. E.g.: `unload'[[ $PWD != */github* ]]'`.</div>                                                                                                                                                                                                                                  |
|                               `cloneonly`                                | <div align="justify" style="text-align: justify;">Don't load the plugin / snippet, only download it </div>                                                                                                                                                                                                                                                                                                                       |
|                                   `if`                                   | <div align="justify" style="text-align: justify;">Load plugin or snippet only when given condition is fulfilled, for example: `zi ice if'[[ -n "$commands[otool]" ]]'; zi load ...`.</div>                                                                                                                                                                                                                                       |
|                                  `has`                                   | <div align="justify" style="text-align: justify;">Load plugin or snippet only when given command is available (in \$PATH), e.g. `zi ice has'git' ...` </div>                                                                                                                                                                                                                                                                     |
|                       `subscribe` / `on-update-of`                       | <div align="justify" style="text-align: justify;">Postpone loading of a plugin or snippet until the given file(s) get updated, e.g. `subscribe'{~/files-*,/tmp/files-*}'` </div>                                                                                                                                                                                                                                                 |
|                              `trigger-load`                              | <div align="justify" style="text-align: justify;">Creates a function that loads the associated plugin/snippet, with an option (to use it, precede the ice content with `!`) to automatically forward the call afterwards, to a command of the same name as the function. Can obtain multiple functions to create – sparate with `;`.</div>                                                                                       |

</details>

<details>
<summary> Plugin Output </summary>

| Modifier | Description                                                                                                                                                                                                                                                                                                                                                         |
| :------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `silent` | <div align="justify" style="text-align: justify;">Mute plugin's or snippet's `stderr` & `stdout`. Also skip `Loaded ...` message under prompt for `wait`, etc. loaded plugins, and completion-installation messages.</div>                                                                                                                                          |
| `lucid`  | <div align="justify" style="text-align: justify;">Skip `Loaded ...` message under prompt for `wait`, etc. loaded plugins (a subset of `silent`).</div>                                                                                                                                                                                                              |
| `notify` | <div align="justify" style="text-align: justify;">Output given message under-prompt after successfully loading a plugin/snippet. In case of problems with the loading, output a warning message and the return code. If starts with `!` it will then always output the given message. Hint: if the message is empty, then it will just notify about problems.</div> |

</details>
<details>
<summary> Completions </summary>

|    Modifier     | Description                                                                                                                                                                                                                              |
| :-------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    `blockf`     | <div align="justify" style="text-align: justify;">Disallow plugin to modify `fpath`. Useful when a plugin wants to provide completions in traditional way. ZI can manage completions and plugin can be blocked from exposing them.</div> |
| `nocompletions` | <div align="justify" style="text-align: justify;">Don't detect, install and manage completions for this plugin. Completions can be installed later with `zi creinstall {plugin-spec}`.</div>                                             |

</details>

<details>
<summary> Command Execution After Cloning, Updating or Loading </summary>

|                                   Modifier                                   | Description                                                                                                                                                                                                                                                                                                                                                          |
| :--------------------------------------------------------------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                     `mv`                                     | <div align="justify" style="text-align: justify;">Move file after cloning or after update (then, only if new commits were downloaded). Example: `mv "fzf-* -> fzf"`. It uses `->` as separator for old and new file names. Works also with snippets.</div>                                                                                                           |
|                                     `cp`                                     | <div align="justify" style="text-align: justify;">Copy file after cloning or after update (then, only if new commits were downloaded). Example: `cp "docker-c* -> dcompose"`. Ran after `mv`.</div>                                                                                                                                                                  |
| [**`atclone`**](https://github.com/z-shell/zi/wiki/atload-and-other-at-ices) | <div align="justify" style="text-align: justify;">Run command after cloning, within plugin's directory, e.g. `zi ice atclone"echo Cloned"`. Ran also after downloading snippet.</div>                                                                                                                                                                                |
| [**`atpull`**](https://github.com/z-shell/zi/wiki/atload-and-other-at-ices)  | <div align="justify" style="text-align: justify;">Run command after updating (**only if new commits are waiting for download**), within plugin's directory. If starts with "!" then command will be ran before `mv` & `cp` ices and before `git pull` or `svn update`. Otherwise it is ran after them. Can be `atpull'%atclone'`, to repeat `atclone` Ice-mod.</div> |
| [**`atinit`**](https://github.com/z-shell/zi/wiki/atload-and-other-at-ices)  | <div align="justify" style="text-align: justify;">Run command after directory setup (cloning, checking it, etc.) of plugin/snippet but before loading.</div>                                                                                                                                                                                                         |
| [**`atload`**](https://github.com/z-shell/zi/wiki/atload-and-other-at-ices)  | <div align="justify" style="text-align: justify;">Run command after loading, within plugin's directory. Can be also used with snippets. Passed code can be preceded with `!`, it will then be investigated (if using `load`, not `light`).</div>                                                                                                                     |
|                                 `run-atpull`                                 | <div align="justify" style="text-align: justify;">Always run the atpull hook (when updating), not only when there are new commits to be downloaded.</div>                                                                                                                                                                                                            |
|                                    `nocd`                                    | <div align="justify" style="text-align: justify;">Don't switch the current directory into the plugin's directory when evaluating the above ice-mods `atinit''`,`atload''`, etc.</div>                                                                                                                                                                                |
|    [**`make`**](https://github.com/z-shell/zi/wiki/Installing-with-make)     | <div align="justify" style="text-align: justify;">Run `make` command after cloning/updating and executing `mv`, `cp`, `atpull`, `atclone` Ice mods. Can obtain argument, e.g. `make"install PREFIX=/opt"`. If the value starts with `!` then `make` is ran before `atclone`/`atpull`, e.g. `make'!'`.</div>                                                          |
|                                 `countdown`                                  | <div align="justify" style="text-align: justify;">Causes an interruptable (by Ctrl-C) countdown 5…4…3…2…1…0 to be displayed before executing `atclone''`,`atpull''` and `make` ices</div>                                                                                                                                                                            |
|                                   `reset`                                    | <div align="justify" style="text-align: justify;">Invokes `git reset --hard HEAD` for plugins or `svn revert` for SVN snippets before pulling any new changes. This way `git` or `svn` will not report conflicts if some changes were done in e.g.: `atclone''` ice. For file snippets and `gh-r` plugins it invokes `rm -rf *`.</div>                               |

</details>

<details>
<summary> Sticky-Emulation Of Other Shells </summary>

|    Modifier     | Description                                                                                                                                                                                                                                                                                                                                                                                        |
| :-------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|   `sh`, `!sh`   | <div align="justify" style="text-align: justify;">Source the plugin's (or snippet's) script with `sh` emulation so that also all functions declared within the file will get a _sticky_ emulation assigned – when invoked they'll execute also with the `sh` emulation set-up. The `!sh` version switches additional options that are rather not important from the portability perspective.</div> |
| `bash`, `!bash` | <div align="justify" style="text-align: justify;">The same as `sh`, but with the `SH_GLOB` option disabled, so that Bash regular expressions work.</div>                                                                                                                                                                                                                                           |
|  `ksh`, `!ksh`  | <div align="justify" style="text-align: justify;">The same as `sh`, but emulating `ksh` shell.</div>                                                                                                                                                                                                                                                                                               |
|  `csh`, `!csh`  | <div align="justify" style="text-align: justify;">The same as `sh`, but emulating `csh` shell.</div>                                                                                                                                                                                                                                                                                               |

</details>

<details>
<summary> Others </summary>

|                             Modifier                              | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| :---------------------------------------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                               `as`                                | <div align="justify" style="text-align: justify;">Can be `as"program"` (also the alias: `as"command"`), and will cause to add script/program to `$PATH` instead of sourcing (see `pick`). Can also be `as"completion"` – use with plugins or snippets in whose only underscore-starting `_*` files you are interested in. The third possible value is `as"null"` – a shorthand for `pick"/dev/null" nocompletions` – i.e.: it disables the default script-file sourcing and also the installation of completions.</div>                                                                                                                                                                                                   |
|     [**`id-as`**](https://github.com/z-shell/zi/wiki/id-as/)      | <div align="justify" style="text-align: justify;">Nickname a plugin or snippet, to e.g. create a short handler for long-url snippet.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|                             `compile`                             | <div align="justify" style="text-align: justify;">Pattern (+ possible `{...}` expansion, like `{a/*,b*}`) to select additional files to compile, e.g. `compile"(pure\|async).zsh"` for `sindresorhus/pure`.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                            `nocompile`                            | <div align="justify" style="text-align: justify;">Don't try to compile `pick`-pointed files. If passed the exclamation mark (i.e. `nocompile'!'`), then do compile, but after `make''` and `atclone''` (useful if Makefile installs some scripts, to point `pick''` at the location of their installation).</div>                                                                                                                                                                                                                                                                                                                                                                                                         |
|                             `service`                             | <div align="justify" style="text-align: justify;">Make following plugin or snippet a _service_, which will be ran in background, and only in single Zshell instance. See [#z-service](https://github.com/search?q=topic%3Az-service+org%3Az-shell&type=Repositories) topic.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|                          `reset-prompt`                           | <div align="justify" style="text-align: justify;">Reset the prompt after loading the plugin/snippet (by issuing `zle .reset-prompt`). Note: normally it's sufficient to precede the value of `wait''` ice with `!`.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                             `bindmap`                             | <div align="justify" style="text-align: justify;">To hold `;`-separated strings like `Key(s)A -> Key(s)B`, e.g. `^R -> ^T; ^A -> ^B`. In general, `bindmap''`changes bindings (done with the `bindkey` builtin) the plugin does. The example would cause the plugin to map Ctrl-T instead of Ctrl-R, and Ctrl-B instead of Ctrl-A. **Does not work with snippets.**</div>                                                                                                                                                                                                                                                                                                                                                 |
|                           `trackbinds`                            | <div align="justify" style="text-align: justify;">Shadow but only `bindkey` calls even with `zi light ...`, i.e. even with investigating disabled (fast loading), to allow `bindmap` to remap the key-binds. The same effect has `zi light -b ...`, i.e. additional `-b` option to the `light`-subcommand. **Does not work with snippets.**</div>                                                                                                                                                                                                                                                                                                                                                                         |
| [**`wrap-track`**](https://github.com/z-shell/zi/wiki/wrap-track) | <div align="justify" style='text-align: justify;'> Takes a `;`-separated list of function names that are to be investigated (meaning gathering report and unload data) **once** during execution. It works by wrapping the functions with a investigating-enabling and disabling snippet of code. In summary, `wrap-track` allows to extend the investigating beyond the moment of loading of a plugin. Example use is to `wrap-track` a precmd function of a prompt (like `_p9k_precmd()` of powerlevel10k) or other plugin that _postpones its initialization till the first prompt_ (like e.g.: zsh-autosuggestions). **Does not work with snippets.**</div>                                                           |
|                             `aliases`                             | <div align="justify" style="text-align: justify;">Load the plugin with the aliases mechanism enabled. Use with plugins that define **and use** aliases in their scripts.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|                           `light-mode`                            | <div align="justify" style="text-align: justify;">Load the plugin without the investigating, i.e.: as if it would be loaded with the `light` command. Useful for the for-syntax, where there is no `load` nor `light` subcommand</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [**`extract`**](https://github.com/z-shell/zi/wiki/extract-Ice/)  | <div align="justify" style="text-align: justify;">Performs archive extraction supporting multiple formats like `zip`, `tar.gz`, etc. and also notably OS X `dmg` images. If it has no value, then it works in the _auto_ mode – it automatically extracts all files of known archive extensions IF they aren't located deeper than in a sub-directory (this is to prevent extraction of some helper archive files, typically located somewhere deeper in the tree). If no such files will be found, then it extracts all found files of known **type** – the type is being read by the `file` Unix command. If not empty, then takes names of the files to extract. Refer to the Wiki page for further information.</div> |
|                              `subst`                              | <div align="justify" style="text-align: justify;">Substitute the given string into another string when sourcing the plugin script, e.g.: `zi subst'autoload → autoload -Uz' …`.</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                            `autoload`                             | <div align="justify" style="text-align: justify;">Autoload the given functions (from their files). Equvalent to calling `atinit'autoload the-function'`. Supports renaming of the function – pass `'… → new-name'` or `'… -> new-name'`, e.g.: `zi autoload'fun → my-fun; fun2 → my-fun2'`.</div>                                                                                                                                                                                                                                                                                                                                                                                                                         |

</details>

<details>
<summary> Order of Execution </summary>

Order of execution of related Ice-mods: `atinit` -> `atpull!` -> `make'!!'` -> `mv` -> `cp` -> `make!` -> `atclone`/`atpull` -> `make` -> `(plugin script loading)` -> `src` -> `multisrc` -> `atload`.

</details>

## A Few Remarks

- The syntax automatically detects if the object is a snippet or a plugin, by
  checking if the object is an URL, i.e.: if it starts with `http*://` or
  `OMZ::`, etc.
- To load a local-file snippet (which will be treaten as a local-directory
  plugin by default) use the `is-snippet` ice,
- To load a plugin in `light` mode use the `light-mode` ice.
- If the plugin name collides with an ice name, precede the plugin name with
  `@`, e.g.: `@sharkdp/fd` (collides with the `sh` ice, ZI will take the
  plugin name as `sh"arkdp/fd"`), see the next section for an example.

## Examples

Load a few useful binary (i.e.: binary packages from the GitHub Releases) utils:

```zsh
zi as"null" wait"2" lucid from"gh-r" for \
  mv"exa* -> exa" sbin ogham/exa \
  mv"fd* -> fd" sbin"fd/fd" @sharkdp/fd \
  sbin"fzf" junegunn/fzf-bin
```

Note: `sbin''` is an ice added by the
[z-a-bin-gem-node](https://github.com/z-shell/z-a-bin-gem-node) annex, it
provides the command to the command line without altering `$PATH`. If the name
of the command is the same as the name of the plugin, the ice contents can be
skipped.

Turbo load some plugins, without any plugin-specific ices:

```zsh
zi wait lucid for \
  hlissner/zsh-autopair \
  urbainvaes/fzf-marks
```

Load two Oh My Zsh files as snippets, in Turbo:

```zsh
zi wait lucid for \
  OMZ::lib/git.zsh \
  atload"unalias grv" OMZ::plugins/git/git.plugin.zsh
```
