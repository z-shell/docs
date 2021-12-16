- [Loading and Unloading](#loading-and-unloading)
- [Completions Management](#completions-management)
- [Tracking of the Active Session](#tracking-of-the-active-session)
- [Reports and Statistics](#reports-and-statistics)
- [Compiling](#compiling)
- [Other](#other)
- [Updating ZI and Plugins](#updating-zi-and-plugins)
- [Calling `compinit` Without Turbo Mode](#calling-compinit-without-turbo-mode)
- [Calling `compinit` With Turbo Mode](#calling-compinit-with-turbo-mode)
  - [Ignoring Compdefs](#ignoring-compdefs)
- [Help & Manual](#help--manual)

---

Following commands are passed to `zi ...` to obtain described effects.

## Loading and Unloading

|           Command           | Description                                                                                                                                                                                                                                                                                                          |
| :-------------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|    `load {plugin-spec}`     | Load plugin, can also receive absolute local path.                                                                                                                                                                                                                                                                   |
| `light [-b] {plugin-spec}`  | Light plugin load, without reporting/investigating. `-b` – investigate `bindkey`-calls only. There's also `light-mode` ice which can be used to induce the no-investigating (i.e.: _light_) loading, regardless of the command used.                                                                                 |
| `unload [-q] {plugin-spec}` | Unload plugin loaded with `zi load ...`. `-q` – quiet.                                                                                                                                                                                                                                                               |
|    `snippet [-f] {url}`     | Source local or remote file (by direct URL). `-f` – don't use cache (force redownload). The URL can use the following shorthands: `PZT::` (Prezto), `PZTM::` (Prezto module), `OMZ::` (Oh My Zsh), `OMZP::` (OMZ plugin), `OMZL::` (OMZ library), `OMZT::` (OMZ theme), e.g.: `PZTM::environment`, `OMZP::git`, etc. |

## Completions Management

|                            Command                            | Description                                                                                                                                                                                                    |
| :-----------------------------------------------------------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <code> clist \[_columns_\], completions \[_columns_\] </code> | <div align="justify" style="text-align: justify;"> List completions in use, with <code>_columns_</code> completions per line. `zpl clist 5` will for example print 5 completions per line. Default is 3.</div> |
|                      `cdisable {cname}`                       | <div align="justify" style="text-align: justify;"> Disable completion `cname`.</div>                                                                                                                           |
|                       `cenable {cname}`                       | <div align="justify" style="text-align: justify;"> Enable completion `cname`.</div>                                                                                                                            |
|             `creinstall [-q] [-Q] {plugin-spec}`              | <div align="justify" style="text-align: justify;"> Install completions for plugin, can also receive absolute local path. `-q` – quiet. `-Q` - quiet all.</div>                                                 |
|                  `cuninstall {plugin-spec}`                   | <div align="justify" style="text-align: justify;"> Uninstall completions for plugin.</div>                                                                                                                     |
|                           `csearch`                           | <div align="justify" style="text-align: justify;"> Search for available completions from any plugin.</div>                                                                                                     |
|                          `compinit`                           | <div align="justify" style="text-align: justify;"> Refresh installed completions.</div>                                                                                                                        |
|                           `cclear`                            | <div align="justify" style="text-align: justify;"> Clear stray and improper completions.</div>                                                                                                                 |
|                           `cdlist`                            | <div align="justify" style="text-align: justify;"> Show compdef replay list.</div>                                                                                                                             |
|                        `cdreplay [-q]`                        | <div align="justify" style="text-align: justify;"> Replay compdefs (to be done after compinit). `-q` – quiet.</div>                                                                                            |
|                        `cdclear [-q]`                         | <div align="justify" style="text-align: justify;"> Clear compdef replay list. `-q` – quiet.</div>                                                                                                              |

## Tracking of the Active Session

|     Command      | Description                                                                                                |
| :--------------: | ---------------------------------------------------------------------------------------------------------- |
| `dtrace, dstart` | <div align="justify" style="text-align: justify;"> Start investigating what's going on in session.</div>   |
|     `dstop`      | <div align="justify" style="text-align: justify;"> Stop investigating what's going on in session.</div>    |
|    `dunload`     | <div align="justify" style="text-align: justify;"> Revert changes recorded between dstart and dstop.</div> |
|    `dreport`     | <div align="justify" style="text-align: justify;"> Report what was going on in session.</div>              |
|     `dclear`     | <div align="justify" style="text-align: justify;"> Clear report of what was going on in session.</div>     |

## Reports and Statistics

|              Command               | Description                                                                                                                                                                                           |
| :--------------------------------: | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|         `times [-s] [-m]`          | <div align="justify" style="text-align: justify;"> Statistics on plugin load times, sorted in order of loading. `-s` – use seconds instead of milliseconds. `-m` – show plugin loading moments.</div> |
|             `zstatus`              | <div align="justify" style="text-align: justify;"> Overall ZI status.</div>                                                                                                                           |
|   `report {plugin-spec}\|--all`    | <div align="justify" style="text-align: justify;"> Show plugin report. `--all` – do it for all plugins.</div>                                                                                         |
| `loaded [keyword], list [keyword]` | <div align="justify" style="text-align: justify;"> Show what plugins are loaded (filter with 'keyword').</div>                                                                                        |
|                `ls`                | <div align="justify" style="text-align: justify;"> List snippets in formatted and colorized manner. Requires **tree** program.</div>                                                                  |
| `status {plugin-spec}\|URL\|--all` | <div align="justify" style="text-align: justify;"> Git status for plugin or svn status for snippet. `--all` – do it for all plugins and snippets.</div>                                               |
|       `recently [time-spec]`       | <div align="justify" style="text-align: justify;"> Show plugins that changed recently, argument is e.g. 1 month 2 days.</div>                                                                         |
|             `bindkeys`             | <div align="justify" style="text-align: justify;"> Lists bindkeys set up by each plugin.</div>                                                                                                        |

## Compiling

|             Command              | Description                                                                                                                  |
| :------------------------------: | ---------------------------------------------------------------------------------------------------------------------------- |
|  `compile {plugin-spec}\|--all`  | <div align="justify" style="text-align: justify;"> Compile plugin. `--all` – compile all plugins.</div>                      |
| `uncompile {plugin-spec}\|--all` | <div align="justify" style="text-align: justify;"> Remove compiled version of plugin. `--all` – do it for all plugins.</div> |
|            `compiled`            | <div align="justify" style="text-align: justify;"> List plugins that are compiled.</div>                                     |

## Other

|                               Command                               | Description                                                                                                                                                                                                                                                                                                                                                                                      |
| :-----------------------------------------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|                            `self-update`                            | <div align="justify" style="text-align: justify;"> Updates and compiles ZI.</div>                                                                                                                                                                                                                                                                                                                |
|            `update [-q] [-r] {plugin-spec}\|URL\|--all`             | <div align="justify" style="text-align: justify;"> Git update plugin or snippet.<br> `--all` – update all plugins and snippets.<br> `-q` – quiet.<br> `-r` \| `--reset` – run `git reset --hard` / `svn revert` before pulling changes.</div>                                                                                                                                                    |
|                      `ice <ice specification>`                      | <div align="justify" style="text-align: justify;"> Add ice to next command, argument is e.g. from"gitlab".</div>                                                                                                                                                                                                                                                                                 |
|             `delete {plugin-spec}\|URL\|--clean\|--all`             | <div align="justify" style="text-align: justify;"> Remove plugin or snippet from disk (good to forget wrongly passed ice-mods). <br> `--all` – purge.<br> `--clean` – delete plugins and snippets that are not loaded.</div>                                                                                                                                                                     |
|                         `cd {plugin-spec}`                          | <div align="justify" style="text-align: justify;"> Cd into plugin's directory. Also support snippets if fed with URL.</div>                                                                                                                                                                                                                                                                      |
|                        `edit {plugin-spec}`                         | <div align="justify" style="text-align: justify;"> Edit plugin's file with \$EDITOR.</div>                                                                                                                                                                                                                                                                                                       |
|                       `glance {plugin-spec}`                        | <div align="justify" style="text-align: justify;"> Look at plugin's source (pygmentize, {,source-}highlight).</div>                                                                                                                                                                                                                                                                              |
|                       `stress {plugin-spec}`                        | <div align="justify" style="text-align: justify;"> Test plugin for compatibility with set of options.</div>                                                                                                                                                                                                                                                                                      |
|                       `changes {plugin-spec}`                       | <div align="justify" style="text-align: justify;"> View plugin's git log.</div>                                                                                                                                                                                                                                                                                                                  |
|                       `create {plugin-spec}`                        | <div align="justify" style="text-align: justify;"> Create plugin (also together with GitHub repository).</div>                                                                                                                                                                                                                                                                                   |
|                      `srv {service-id} [cmd]`                       | <div align="justify" style="text-align: justify;"> Control a service, command can be: stop,start,restart,next,quit; `next` moves the service to another Zshell.</div>                                                                                                                                                                                                                            |
|                     `recall {plugin-spec}\|URL`                     | <div align="justify" style="text-align: justify;"> Fetch saved ice modifiers and construct `zi ice ...` command.</div>                                                                                                                                                                                                                                                                           |
|                  `env-whitelist [-v] [-h] {env..}`                  | <div align="justify" style="text-align: justify;"> Allows to specify names (also patterns) of variables left unchanged during an unload. `-v` – verbose.</div>                                                                                                                                                                                                                                   |
|                              `module`                               | <div align="justify" style="text-align: justify;"> Manage binary Zsh module shipped with ZI, see `zi module help`.</div>                                                                                                                                                                                                                                                                         |
| `add-fpath\|fpath` `[-f\|--front]` `{plugin-spec}` `[subdirectory]` | <div align="justify" style="text-align: justify;">Adds given plugin (not yet snippet) directory to `$fpath`. If the second argument is given, it is appended to the directory path. If the option `-f`/`--front` is given, the directory path is prepended instead of appended to `$fpath`. The `{plugin-spec}` can be absolute path, i.e.: it's possible to also add regular directories.</div> |
|                 `run` `[-l]` `[plugin]` `{command}`                 | <div align="justify" style="text-align: justify;">Runs the given command in the given plugin's directory. If the option `-l` will be given then the plugin should be skipped – the option will cause the previous plugin to be reused.</div>                                                                                                                                                     |

## Updating ZI and Plugins

To update ZI issue `zi self-update` in the command line.

To update all plugins and snippets, issue `zi update`. If you wish to update only
a single plugin/snippet instead issue `zi update NAME_OF_PLUGIN`. A list of
commits will be shown:

<p align="center">

![update](https://github.com/z-shell/zinit/raw/main/doc/img/update.png)

</p>

Some plugins require performing an action each time they're updated. One way you can do
this is by using the `atpull` ice modifier. For example, writing `zi ice atpull'./configure'` before loading a plugin will execute `./configure` after a successful update. Refer to [Ice Modifiers](ice-modifiers) for more information.

The ice modifiers for any plugin or snippet are stored in their directory in a
`._zi` subdirectory, hence the plugin doesn't have to be loaded to be correctly
updated. There's one other file created there, `.zi_lstupd` – it holds the log of
the new commits pulled-in in the last update.

## Calling `compinit` Without Turbo Mode

With no Turbo mode in use, compinit can be called normally, i.e.: as `autoload compinit; compinit`. This should be done after loading of all plugins and before possibly calling
`zi cdreplay`.

The `cdreplay` subcommand is provided to re-play all caught `compdef` calls. The
`compdef` calls are used to define a completion for a command. For example, `compdef _git git` defines that the `git` command should be completed by a `_git` function.

The `compdef` function is provided by `compinit` call. As it should be called later,
after loading all of the plugins, ZI provides its own `compdef` function that
catches (i.e.: records in an array) the arguments of the call, so that the loaded
plugins can freely call `compdef`. Then, the `cdreplay` (_compdef-replay_) can be used,
after `compinit` will be called (and the original `compdef` function will become
available), to execute all detected `compdef` calls. To summarize:

```sh
source ~/.zi/bin/zi.zsh

zi load "some/plugin"
...
compdef _gnu_generic fd  # this will be intercepted by ZI, because as the compinit
                         # isn't yet loaded, thus there's no such function `compdef'; yet
                         # ZI provides its own `compdef' function which saves the
                         # completion-definition for later possible re-run with `zi
                         # cdreplay' or `zicdreplay' (the second one can be used in hooks
                         # like atload'', atinit'', etc.)
...
zi load "other/plugin"

autoload -Uz compinit
compinit

zi cdreplay -q      # -q is for quiet; actually, run all the `compdef's saved before
                    #`compinit` call (`compinit' declares the `compdef' function, so
                    # it cannot be used until `compinit' is run; ZI solves this
                    # via intercepting the `compdef'-calls and storing them for later
                    # use with `zi cdreplay')
```

This allows calling compinit once.
Performance gains are huge, for example, shell startup time with double `compinit`: **0.980** sec, with
`cdreplay` and single `compinit`: **0.156** sec.

## Calling `compinit` With Turbo Mode

If you load completions using `wait''` Turbo mode then you can add
`atinit'zicompinit'` to the syntax-highlighting plugin (which should be the last
one loaded, as their (2 projects, [Z-Sy-H](https://github.com/zsh-users/zsh-syntax-highlighting) &
[F-Sy-H](https://github.com/z-shell/F-Sy-H))
documentation state), or `atload'zicompinit'` to last
completion-related plugin. `zicompinit` is a function that just runs `autoload compinit; compinit`, created for convenience. There's also `zicdreplay` which
will replay any caught compdefs so you can also do: `atinit'zicompinit; zicdreplay'`, etc. Basically, the whole topic is the same as normal `compinit` call,
but it is done in `atinit` or `atload` hook of the last related plugin with the use of the
helper functions (`zicompinit`,`zicdreplay` & `zicdclear` – see below for explanation
of the last one). To summarize:

```zsh
source ~/.zi/bin/zi.zsh

# Load using the for-syntax
zi wait lucid for \
    "some/plugin"
zi wait lucid for \
    "other/plugin"

zi wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
```

### Ignoring Compdefs

If you want to ignore compdefs provided by some plugins or snippets, place their load commands
before commands loading other plugins or snippets, and issue `zi cdclear` (or
`zicdclear`, designed to be used in hooks like `atload''`):

```SystemVerilog
source ~/.zi/bin/zi.zsh
zi snippet OMZP::git
zi cdclear -q # <- forget completions provided by Git plugin

zi load "some/plugin"
...
zi load "other/plugin"

autoload -Uz compinit
compinit
zi cdreplay -q # <- execute compdefs provided by rest of plugins
zi cdlist # look at gathered compdefs
```

The `cdreplay` is important if you use plugins like
`OMZP::kubectl` or `asdf-vm/asdf`, because these plugins call `compdef`.

## Help & Manual

|  Command   | Description                                                                 |
| :--------: | --------------------------------------------------------------------------- |
| `-h, help` | <div align="justify" style="text-align: justify;"> Usage information.</div> |
|   `man`    | <div align="justify" style="text-align: justify;"> Manual.</div>            |
