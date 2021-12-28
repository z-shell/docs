---
sidebar_position: 1
id: overview
title: Overview
slug: /overview
---

In this overview will cover basics for:

- Oh My Zsh & Prezto,
- Completions,
- Turbo mode,
- Ice-mods

## Basic Plugin Loading

```shell
zi load z-shell/H-S-MW
zi light zsh-users/zsh-syntax-highlighting
```

The above commands show two ways of basic plugin loading. <code>load</code> causes reporting to
be enabled – you can track what plugin does, view the information with `zi report {plugin-name}` and then also unload the plugin with `zi unload {plugin-name}`. `light` is a significantly faster loading without tracking and reporting, by using which user resigns of the ability to view the plugin report
and to unload it.

:::note

In Turbo mode the slowdown caused by tracking is negligible..

:::

## Oh My Zsh, Prezto

To load Oh My Zsh and Prezto plugins, use the `snippet` feature. Snippets are single
files downloaded by `curl`, `wget`, etc. (automatic detection of the download
tool is being performed) directly from the URL. For example:

```shell
zi snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'
zi snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/helper/init.zsh'
```

Also, for Oh My Zsh and Prezto, you can use `OMZ::` and `PZT::` shorthands:

```shell
zi snippet OMZ::plugins/git/git.plugin.zsh
zi snippet PZT::modules/helper/init.zsh
```

Moreover, snippets support Subversion protocol, supported also by Github. This
allows loading snippets that are multi-file (for example, a Prezto module can
consist of two or more files, e.g. `init.zsh` and `alias.zsh`). Default files
that will be sourced are: `*.plugin.zsh`, `init.zsh`, `*.zsh-theme`:

```shell {3}
# URL points to a directory
zi ice svn
zi snippet PZT::modules/docker
```

## Snippets and Performance

Using `curl`, `wget`, etc. along with Subversion allows to almost completely
avoid code dedicated to Oh My Zsh and Prezto, and also to other frameworks. This
gives profits in performance of `ZI`, it is really fast and also compact
(causing low memory footprint and short loading time).

## Ice-Modifiers

:::info

See: [ice-modifiers](Ice-modifiers) for more information.

:::

The command `zi ice` provides ice-modifiers for single next command. The logic is that "ice" is something that’s added (e.g. to a drink or a coffee) – and in the ZI sense this means that ice is a modifier added to the next ZI command, and also something that melts (so it doesn’t last long) – and in the ZI use it means that the modifier lasts for only single next ZI command. Using one other ice-modifier "**pick**" users can explicitly **select the file to source**:

```shell {1}
zi ice svn pick"init.zsh"
zi snippet PZT::modules/git
```

Content of ice-modifier is simply put into `"…"`, `'…'`, or `$'…'`.
No need for `":"` after the ice-mod name (although it's allowed, so as the equal sign `=`,
so e.g. `pick="init.zsh"` or `pick=init.zsh` are being correctly recognized).
This way editors like `vim` and `emacs` and also `zsh-users/zsh-syntax-highlighting` and `z-shell/F-Sy-H` will highlight contents of ice-modifiers.

## as"program"

A plugin might not be a file for sourcing, but a command to be added to `$PATH`.
To obtain this effect, use ice-modifier `as` with value `program` (or an alias
value `command`).

```shell
zi ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zi light b4b4r07/httpstat
```

The above command will add plugin directory to `$PATH`, copy file `httpstat.sh` into
`httpstat` and add execution rights (`+x`) to the file selected with `pick`,
i.e. to `httpstat`. Another ice-mod exists, `mv`, which works like `cp` but
**moves** a file instead of **copying** it. `mv` is ran before `cp`.

:::tip

The `cp` and `mv` ices (and also as some other ones, like `atclone`) are
being run when the plugin or snippet is being _installed_.
To test them again first delete the plugin or snippet by `zi delete PZT::modules/osx` (for example).

:::

## atpull"…"

Copying file is safe for doing later updates – original files of the repository are
unmodified and `Git` will report no conflicts. However, `mv` also can be used,
if a proper `atpull` (an ice–modifier ran at **update** of plugin) will be used:

```shell
zi ice as"program" mv"httpstat.sh -> httpstat" \
  pick"httpstat" atpull'!git reset --hard'
zi light b4b4r07/httpstat
```

If `atpull` starts with an exclamation mark, then it will be run before `git pull`,
and before `mv`. Nevertheless, `atpull`, `mv`, `cp` are run **only if new
commits are to be fetched**. So in summary, when the user runs `zi update b4b4r07/httpstat` to update this plugin, and there are new commits, what happens
first is that `git reset --hard` is run – and it **restores** original
`httpstat.sh`, **then** `git pull` is ran and it downloads new commits (doing
fast-forward), **then** `mv` is running again so that the command is `httpstat` not
`httpstat.sh`. This way the `mv` ice can be used to induce permanent changes
into the plugin's contents without blocking the ability to update it with `git`
(or with `subversion` in case of snippets, more on this below at
[**\*\***](#on_svn_revert)).

:::info

For exclamation mark to not be expanded by Zsh an interactive session,
use `'…'` not `"…"` to enclose contents of `atpull` ice-mod.\*\*

:::

## Snippets as commands

Commands can also be added to `$PATH` using **snippets**. For example:

```shell {2,4}
zi ice mv"httpstat.sh -> httpstat" \
  pick"httpstat" as"program"
zi snippet \
  https://github.com/b4b4r07/httpstat/blob/master/httpstat.sh
```

:::tip

Snippets also support `atpull` ice-mod, so it’s possible to do e.g. `atpull'!svn revert'`.
There’s also `atinit` ice-mod, executed before each loading of plugin or snippet.

:::

## Snippets as completions

By using the `as''` ice-mod with value `completion` you can point the `snippet`
subcommand directly to a completion file:

```shell {2}
zi ice as"completion"
zi snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
```

## Completion management

ZI allows to disable and enable each completion in every plugin.
Try installing a popular plugin that provides completions:

```shell {1}
zi ice blockf
zi light zsh-users/zsh-completions
```

The first command (the `blockf` ice) will block the traditional method of adding
completions. ZI uses its method (based on symlinks instead of adding several directories to `$fpath`). ZI will automatically **install**
completions of a newly downloaded plugin. To uninstall the completions and
install them again, you would use:

```shell
zi cuninstall zsh-users/zsh-completions # uninstall
zi creinstall zsh-users/zsh-completions # install
```

### Listing Completions

:::note

`zini` is an alias that can be used in interactive sessions.

:::

To see what completions **all** plugins provide, in tabular formatting and with name of each plugin, use:

```shell
zini clist
```

This command is specially adapted for plugins like `zsh-users/zsh-completions`,
which provide many completions – listing will have `3` completions per line (so
that a smaller number of terminal pages will be occupied) like this:

```shell
...
atach, bitcoin-cli, bower zsh-users/zsh-completions
bundle, caffeinate, cap zsh-users/zsh-completions
cask, cf, chattr zsh-users/zsh-completions
...
```

You can show more completions per line by providing an **argument** to `clist`,
e.g. `zi clist 6`, will show:

```shell
...
bundle, caffeinate, cap, cask, cf, chattr zsh-users/zsh-completions
cheat, choc, cmake, coffee, column, composer zsh-users/zsh-completions
console, dad, debuild, dget, dhcpcd, diana zsh-users/zsh-completions
...
```

### Enabling and Disabling completions

Completions can be disabled so that e.g. original Zsh completion will be used.
The commands are very basic, they only need completion **name**:

```shell {1,3}
$ zi cdisable cmake
Disabled cmake completion belonging to zsh-users/zsh-completions
$ zi cenable cmake
Enabled cmake completion belonging to zsh-users/zsh-completions
```

That’s all on completions. There’s one more command, `zi csearch`,
that will **search** all plugin directories for available completions, and show if they are installed:

This sums up complete control over completions.

## Subversion for subdirectories

In general, to use **subdirectories** of Github projects as snippets add
`/trunk/{path-to-dir}` to URL, for example:

```shell
zi ice svn
zi snippet https://github.com/zsh-users/zsh-completions/trunk/src
```

:::tip

For Oh My Zsh and Prezto, the OMZ:: and PZT:: prefixes work
without the need to add the `/trunk/` infix (however the path
should point to a directory, not to a file):

:::

```shell
zi ice svn
zi snippet PZT::modules/docker
```

Snippets too have completions installed by default, like plugins.

## Turbo Mode (Zsh \>= 5.3)

The ice-mod `wait` allows the user to postpone the loading of a plugin to the moment
when the processing of `.zshrc` is finished and the first prompt is being shown.
It is like Windows – during startup, it shows desktop even though it still loads
data in the background. This has drawbacks but is for sure better than a blank screen
for 10 minutes. And here, in ZI, there are no drawbacks of this approach – no
lags, freezes, etc. – the command line is fully usable while the plugins are
being loaded, for any number of plugins.

:::info

Turbo will speed up Zsh startup by <u>50%–80%</u>. For example, instead of 200 ms, it'll be 40 ms.

:::

:::note

Zsh 5.3 or greater is required.

:::

To use this Turbo mode add `wait` ice to the target plugin in one of the following ways:

```shell
PS1="READY > "
zi ice wait'!0'
zi load halfo/lambda-mod-zsh-theme
```

This sets plugin `halfo/lambda-mod-zsh-theme` to be loaded `0` seconds after
`zshrc`. It will fire up after c.a. 1 ms of showing the basic prompt `READY >`.
You probably won't load the prompt in such a way, however, it is a good example
in which Turbo can be directly observed.

The exclamation mark causes ZI to reset the prompt after loading the plugin – it
is needed for themes. The same with Prezto prompts, with a longer delay:

```shell
zi ice svn silent wait'!1' atload'prompt smiley'
zi snippet PZT::modules/prompt
```

Using `zsh-users/zsh-autosuggestions` without any drawbacks:

```shell
zi ice wait lucid atload'_zsh_autosuggest_start'
zi light zsh-users/zsh-autosuggestions
```

Explanation: Autosuggestions uses the `precmd` hook, which is being called right
after processing `zshrc` – `precmd` hooks are being called **right before
displaying each prompt**. Turbo with the empty `wait` ice will postpone the
loading `1` ms after that, so `precmd` will not be called at that first prompt.
This makes autosuggestions inactive at the first prompt. **However** the given
`atload` ice-mod fixes this, it calls the same function that `precmd` would,
right after loading autosuggestions, resulting in the same behavior of
the plugin.

The ice `lucid` causes the under-prompt message saying `Loaded zsh-users/zsh-autosuggestions` that normally appears for every Turbo-loaded
plugin to not show.

### A Quick Glance At [The `for''` syntax](Syntax#the-for-syntax)

This introduction is based on the classic, two-command syntax (`zi ice …; zi load/light/snippet …`) of ZI.
However, there's also available a recently added so-called _for-syntax_.
It is the right moment to take a glance at it, by rewriting the above autosuggestions invocation using it:

```shell
zi wait lucid atload'_zsh_autosuggest_start' light-mode for zsh-users/zsh-autosuggestions
```

The syntax is a more concise one. The single command will work the same
as the previous classic-syntax invocation. It also allows solving some typical
problems when using ZI, like providing common/default ices for a set of
plugins or sourcing multiple files with [`src''` ice](Ice#src-pick-multisrc).
For more information refer to the page dedicated to the syntax ([here](Syntax/)).

### Turbo Loading sophisticated prompts

For some, mostly advanced themes the initialization of the prompt is being done in a `precmd`-hook, i.e.;
in a function that's gets called before each prompt. The hook is installed by the [add-zsh-hook](Zsh-Plugin-Standard#use-of-add-zsh-hook-to-install-hooks) Zsh function by adding its name to the `$precmd_functions` array.

To make the prompt fully initialized after Turbo loading in the middle of the
prompt (the same situation as with the `zsh-autosuggestions` plugin), the hook
should be called from `atload''` ice.

First, find the name of the hook function by examining the `$precmd_functions`
array. For example, for the `robobenklein/zinc` theme, they'll be two functions:
`prompt_zinc_setup` and `prompt_zinc_precmd`:

```shell
root@sg > ~ > print $precmd_functions < ✔ < 22:21:33
_zsh_autosuggest_start prompt_zinc_setup prompt_zinc_precmd
```

Then, add them to the ice-list in the `atload''` ice:

```shell {2}
zi ice wait'!' lucid nocd \
  atload'!prompt_zinc_setup; prompt_zinc_precmd'
zi load robobenklein/zinc
```

The exclamation mark in `atload'!…'` is to track the functions allowing the
plugin to be unloaded, as described [here](Ice#atclone-atpull-atinit-atload).
It might be useful for the multi-prompt setup described next.

## Automatic load/unload based on condition

Ices `load` and `unload` allow defining when you want plugins active or
inactive. For example:

Load when in ~/tmp

```shell {1}
zi ice load'![[ $PWD = */tmp* ]]' unload'![[ $PWD != */tmp* ]]' \
  atload"!promptinit; prompt sprint3"
zi load psprint/zprompts
```

Load when NOT in ~/tmp

```shell {1}
zi ice load'![[ $PWD != */tmp* ]]' unload'![[ $PWD = */tmp* ]]'
zi load russjohnson/angry-fly-zsh
```

Two prompts, each active in different directories. This technique can be used to
have plugin-sets, e.g. by defining parameter `$PLUGINS` with possible values
like `cpp`, `web`, `admin` and by setting `load` / `unload` conditions to
activate different plugins on `cpp`, on `web`, etc.

:::note

- The difference with `wait` is that `load` / `unload` are constantly active, not only till first activation.

- Note that for the unloading of a plugin to work the plugin needs to be loaded with
  tracking (so `zi load …`, not `zi light …`).
  Tracking causes a slight slowdown, however, this doesn’t influence Zsh startup time when using Turbo mode.

:::

:::tip

See: [multiple prompts](Multiple-prompts).
It contains a more real-world examples of a multi-prompt setup,
which is being close to what the author uses in his setup.

:::
