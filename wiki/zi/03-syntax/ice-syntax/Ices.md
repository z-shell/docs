- [The `from` Ice](#the-from-ice)
  - [Explanation](#explanation)
  - [Summary](#summary)
- [The `extract` Ice](#the-extract-ice)
  - [The Automatic Archive-Extraction Ice-Tool](#the-automatic-archive-extraction-ice-tool)
  - [Automatic Mode](#automatic-mode)
  - [Fixed Mode](#fixed-mode)
    - [Filenames With Spaces](#filenames-with-spaces)
- [Flags](#flags)
  - [`ziextract` Function](#ziextract-function)
  - [Supported File Formats](#supported-file-formats)
- [The `src` Ice](#the-src-ice)
  - [Changes In The Recent ZI](#changes-in-the-recent-zi)
- [The `id-as` Ice](#the-id-as-ice)
  - [Nickname a plugin or snippet](#nickname-a-plugin-or-snippet)
  - [`id-as'auto'`](#id-asauto)
  - [Empty `id-as''`](#empty-id-as)
- [The `wait` Ice](#the-wait-ice)
- [The `wrap-track` Ice](#the-wrap-track-ice)
  - [Example](#example)
  - [Summary](#summary-1)
- [The `atload` Ice (and other `at…` ices) syntax](#the-atload-ice-and-other-at-ices-syntax)
  - [_Exclamation mark_-preceded `atload`](#exclamation-mark-preceded-atload)
  - [Example](#example-1)
  - [Practical example](#practical-example)
  - [Summary](#summary-2)

---

### The `from` Ice

In order to install and load a plugin whose repository is private - i.e.:
requires providing credentials in order to log in – use the `from''` ice in the
following way:

```zsh
zi ice from"user@github.com"
zi load user/fsh-auto-themes
```

#### Explanation

The point is that when the `from''` ice isn't one of `gh`, `github`, `gl`,
`gitlab`, `bb`, `bitbucket`, `nb`, `notabug`, `gh-r`, `github-rel` then **it is
treaten as a domain name** and inserted into the domain position into the clone
url. I.e.: the following (more or less) `git clone` command is being run:

```zsh
git clone https://{from-ice-contents}/user/plugin
```

In order to change the protocol, use the `proto''` ice.

#### Summary

By using this method you can clone plugins from e.g. GitHub Enterprise or embed
the passwords as plain text in `.zshrc`.

### The `extract` Ice

#### The Automatic Archive-Extraction Ice-Tool

ZI has a swiss-knife tool for unpacking all kinds of archives – the
`extract''` ice. It works in two modes – automatic mode and fixed mode.

#### Automatic Mode

It is active if the ice is empty (or contains only flags – more on them later).
It works as follows:

1. At first, a recursive search for files of known [file
   extensions](#supported_file_formats) located not deeper than in
   a sub-directory is being performed. All such found files are then extracted.
   - The directory-level limit is to skip extraction of some helper archive
     files, which are typically located somewhere deeper in the directory tree.
2. **IF** no such files will be found, then a recursive search for files of
   known archive **types** will be performed. This is basically done by running
   the `file` Unix command on each file in the plugin or snippet directory and
   then grepping the output for strings like `Zip`, `bzip2`, etc. All such
   discovered files are then extracted.
   - The directory-level requirement is imposed also during this stage - files
     located deeper in the tree than in a sub-directory are omitted.
3. If no archive files will be discovered then no action is being performed and
   also no warning message is being printed.

#### Fixed Mode

It is active when a filename is being passed as the `extract`'s argument, e.g.:
`zi extract=archive.zip for z-shell/null`. Multiple files can be specified
– separated by spaces. In this mode all and only the specified files are being
extracted.

##### Filenames With Spaces

The filenames with spaces in them are supported by a trick – to correctly pass
such a filename to `extract` use the non-breaking space in place of the
in-filename original spaces. The non-breaking space is easy to type by pressing
right Alt and the Space.

### Flags

The value of the ice can begin with a two special characters:

1. Exclamation mark (`!`), i.e.: `extract='!…'` – it'll cause the files to be
   moved one directory-level up upon unpacking,
2. Dash (`-`), i.e.: `extract'-…'` – it'll prevent removal of the archive after
   unpacking.
   - This flag is useful to allow comparing timestamps with the server in case
     of snippet-downloaded file – it will prevent unnecessary downloads during
     `zi update`, as the timestamp of the archive file on the disk will be
     first compared with the HTTP last-modification time header.

The flags can be combined in any order, e.g.: `extract'!-'`.

#### `ziextract` Function

Sometimes a more uncommon unpacking operation is needed. In such case you can
directly use the function that implements the ice – it is called `ziextract`. It
recognizes the following options:

1. `--auto` – runs the automatic extraction.
2. `--move` – performs the one-directory-level-up move of the files after
   unpacking.
3. `--norm` - prevents the archive file removal.
4. And also one option specific only to the function: `--nobkp`, which prevents
   clearing of the plugin's dir before the extraction – normally all the files
   except the archive are being moved into `._backup` directory and after that
   the extraction is performed.
   - `extract` ice also skips creating the backup **if** more than one archive
     is found or given as the argument.

#### Supported File Formats

- Zip,
- RAR,
- tar.gz,
- tar.bz2,
- tar.xz,
- tar.7z,
- tar,
- gz,
- bz2,
- xz,
- 7z,
- OS X **dmg images**.

### The `src` Ice

Normally `src''` can be used to specify additional file to source:

```zsh
zi ice pick"powerless.zsh" src"utilities.zsh"
zi light martinrotter/powerless
```

- `pick''` – provide main file to source (can be a pattern like `*.sh` –
  alphabetically first matched file is sourced),
- `src''` – provide second file to source (not a pattern, plain file name)

---

However, via `atload''` ice one can provide simple loop to source more files:

```zsh
zi ice svn pick"completion.zsh" \
  atload'local f; for f in git.zsh misc.zsh; do \
        source $f \
    done'
zi snippet OMZ::lib
```

- `svn` – use Subversion to clone `OMZ::lib` (the whole Oh My Zsh `lib/`
  directory),
- note that `atload''` uses apostrophes not double quotes, to literally put `$f`
  into the string,
- `atload`'s code is automatically being run **within the snippet's (or
  plugin's) directory**,
- `atload''` code isn't tracked by ZI, i.e. cannot be unloaded, unless you
  load a plugin (not a snippet) with `zi load …` and prepend the value of
  the ice with exclamation mark, i.e. `atload'!local f; for …'`,
- `atload''` is executed after loading main files (`pick''` and `src''` ones).

---

The `multisrc''` ice, which loads **multiple** files enumerated with
spaces as the separator (e.g. `multisrc'misc.zsh grep.zsh'`) and also using
brace-expansion syntax (e.g. `multisrc'{misc,grep}.zsh')`. Example:

```zsh
zi ice svn pick"completion.zsh" multisrc'git.zsh \
    functions.zsh {history,grep}.zsh'
zi snippet OMZ::lib
```

The all possible ways to use the `multisrc''` ice-mod:

```zsh
zi ice depth"1" multisrc="lib/{functions,misc}.zsh" pick"/dev/null"
zi load robbyrussell/oh-my-zsh

# Can use patterns
zi ice svn multisrc"{funct*,misc}.zsh" pick"/dev/null"
zi snippet OMZ::lib

array=({functions,misc}.zsh)
zi ice svn multisrc"$array" pick"/dev/null"
zi snippet OMZ::lib

# Will use the array's value at the moment of plugin load
# – this can matter in case of using Turbo mode
array=({functions,misc}.zsh)
zi ice svn multisrc"\$array" pick"/dev/null"
zi snippet OMZ::lib

# Compatible with KSH_ARRAYS option
array=({functions,misc}.zsh)
zi ice svn multisrc"${array[*]}" pick"/dev/null"
zi snippet OMZ::lib

# Compatible with KSH_ARRAYS option
array=({functions,misc}.zsh)
zi ice svn multisrc"\${array[*]}" pick"/dev/null"
zi snippet OMZ::lib

zi ice svn multisrc"misc.zsh functions.zsh" pick"/dev/null"
zi snippet OMZ::lib

# Also – hack ZI: the ice's contents is simply `eval'-uated
# like follows: eval "reply=($multisrc)". So it might get handy on
# an occasion to pass code there, but first you must close the paren
# and then don't forget to assign `reply', and to provide a trailing
# opening paren. In the code be careful to not redefine any variable
# used internally by ZI – e.g.: `i' is safe:

array=({functions,misc}.zsh)
zi ice svn multisrc'); local i; for i in $array; do \
            reply+=( ${i/.zsh/.sh} ); \
        done; ((1)' pick"/dev/null"
zi snippet OMZ::lib
```

--

#### Changes In The Recent ZI

Recently, ZI has been extended with the [For-Syntax](../For-Syntax/) which
can in some situations replace a typical `multisrc''` loading. The point is that
this syntax allows to easily specify snippets to source – and do this within a
single ZI command. Thus, instead of:

```shell
zi ice multisrc'(functions|misc|completion).zsh'
zi snippet OMZ::lib
```

it's possible to write:

```shell
zi for \
  OMZL::functions.zsh \
  OMZL::misc.zsh \
  OMZL::completion.zsh
```

which is somewhat easier on eyes. Also – an **important** property: the multiple
snippets loaded with the for-syntax are being loaded _separately_, which means
that they will not cause a longer keyboard blockage, which could have been
noticeable – when using Turbo. The ZI scheduler will distribute the work over
time and will allow activation of keyboard in between the snippets. The
`multisrc''` way doesn't work this way – sourcing many files can cause
noticeable keyboard freezes (in Turbo).

### The `id-as` Ice

#### Nickname a plugin or snippet

Zi supports loading a plugin or snippet with a nickname. Set the nickname
through the `id-as` ice-mod. For example, one could try to load
[**docker/compose**](https://github.com/docker/compose) from GitHub binary
releases:

```zsh
zi ice as"program" from"gh-r" mv"docker-c* -> docker-compose"
zi light "docker/compose"
```

This registers plugin under the ID `docker/compose`. Now suppose the user would
want to also load a completion from the project's GitHub repository (not the
binary release catalog) which is also available under the GitHub url-path
**…/docker/compose**. The two IDs, both being "docker/compose", will collide.

The solution to this problem – the `id-as` (to be read as: _identify-as_) ice to
which this document is devoted: by using the `id-as` ice the user can resolve
the conflict by loading the completion under a kind of a _nickname_, for example
under "_dc-complete_", by issuing the following commands:

```zsh
zi ice as"completion" id-as"dc-complete"
zi load docker/compose
```

The plugin (of the type `completion`) is now seen under ID `dc-complete`:

```zsh
~ zi list | grep -i dc-complete
dc-complete
```

Issuing `zi report dc-complete` also works, so as other Zi commands:

```zsh
~ zi report dc-complete
Plugin report for dc-complete
-------------------------------

Completions:
_docker-compose [enabled]
```

This can be also used to nickname snippets. For example, you can use this to
create handy IDs in place of long urls:

```zsh
zi ice as"program" id-as"git-unique"
zi snippet https://github.com/Osse/git-scripts/blob/master/git-unique
```

The commands `zi update git-unique`, `zi delete git-unique` and other
will work normally and e.g. `zi times` will show the _nickname_-ID
`git-unique` instead of the long URL.

#### `id-as'auto'`

There's a special value to the `id-as''` ice – `auto`. It causes the nickname to
be automatically set to the last component of the plugin name or snippet URL.
For example:

```zsh
zi ice as"program" id-as"auto"
zi snippet https://github.com/Osse/git-scripts/blob/master/git-unique
```

will work the same as before, i.e.: like if the ice used was
`id-as'git-unique'`. Example with a plugin:

```zsh
# Will work as if id-as'zsh-autopair' was passed
zi ice wait lucid id-as"auto"
zi load hlissner/zsh-autopair
```

#### Empty `id-as''`

An empty `id-as''` will work the same as `id-as'auto'`, i.e.:

```zsh
# Will work as if id-as'zsh-autopair' was passed
zi ice wait lucid id-as
zi load hlissner/zsh-autopair
```

### The `wait` Ice

!!!note
**Turbo mode, i.e. the `wait` ice that implements it needs Zsh >= 5.3.**

```zsh
zi ice wait'0' # or just: zi ice wait
zi light wfxr/forgit
```

- waits for prompt,
- instantly ("0" seconds) after prompt loads given plugin.

```zsh
zi ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zi light z-shell/zi-crasis
```

- `$ZLAST_COMMANDS` is an array build by [**fast-syntax-highlighting**](https://github.com/z-shell/fast-syntax-highlighting), it contains commands currently entered at prompt,
- `(r)` searches for element that matches given pattern (`cras*`) and returns it,
- `-n` means: not-empty, so it will be true when users enters "cras",
- after 1 second or less, ZI will detect that `wait''` condition is true, and load the plugin, which provides command _crasis_,
- Screencast that presents the feature:
  [![screencast](https://asciinema.org/a/149725.svg)](https://asciinema.org/a/149725)

```zsh
zi ice wait'[[ $PWD = */github || $PWD = */github/* ]]'
zi load unixorn/git-extra-commands
```

- waits until user enters a `github` directory.

Turbo mode also support a suffix – the letter `a`, `b` or `c`. The meaning is
illustrated by the following example:

```zsh
zi ice wait"0b" as"command" pick"wd.sh" atinit"echo Firing 1" lucid
zi light mfaerevaag/wd
zi ice wait"0a" as"command" pick"wd.sh" atinit"echo Firing 2" lucid
zi light mfaerevaag/wd

# The output
Firing 2
Firing 1
```

As it can be seen, the second plugin has been loaded first. That's because there
are now three sub-slots (the `a`, `b` and `c`) in which the plugin/snippet
loadings can be put into. Plugins from the same time-slot with suffix `a` will
be loaded before plugins with suffix `b`, etc.

In other words, instead of `wait'1'` you can enter `wait'1a'`, `wait'1b'` and
`wait'1c'` – to this way **impose order** on the loadings **regardless of the
order of `zi` commands**.

### The `wrap-track` Ice

The `wrap-track` ice-mod allows to extend the tracking (i.e. gathering of report
and unload data) of a plugin beyond the moment of sourcing it's main file(s). It
works by wrapping the given functions with a tracking-enabling and disabling
snippet of code. This is useful especially with prompts, as they very often do
their initialization in the first call to their `precmd` [**hook**
](http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions)
function. For example,
[**romkatv/powerlevel10k**](https://github.com/romkatv/powerlevel10k) works this
way.

The ice takes a list of function names, with the elements separated by `;`:

```zsh
zi ice wrap-track"func1;func2;…" …
…
```

#### Example

Therefore, to e.g. load and unload the example powerlevel10k prompt in the
fashion of [**Multiple prompts**](../Multiple-prompts/) article, the `precmd`
function of the plugin – called `_p9k_precmd` (to get the name of the function
do `echo $precmd_functions` after loading a theme) – should be passed to
`wrap-track''` ice, like so:

```zsh
# Load when MYPROMPT == 4
zi ice load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' \
  atload'source ~/.p10k.zsh; _p9k_precmd' wrap-track'_p9k_precmd'
zi load romkatv/powerlevel10k
```

This way the actions done during the first call to `_p9k_precmd()` will be
normally recorded, which can be viewed in the report of the
[**romkatv/powerlevel10k**](https://github.com/romkatv/powerlevel10k) theme:

<pre>
<code>~ zplg report romkatv/powerlevel10k:
Report for romkatv/powerlevel10k plugin
<span class="hljs-blue">---------------------------------------</span>
Source powerlevel10k.zsh-theme (reporting enabled)
Autoload is-at-least with options -U -z

(…)

Note: === Starting to track function: _p9k_precmd ===
Zle -N p9k-orig-zle-line-finish _zsh_highlight_widget_zle-line-finish
Note: a new widget created via zle -N: p9k-orig-zle-line-finish
Zle -N -- zle-line-finish _p9k_wrapper__p9k_zle_line_finish
Autoload vcs_info with options -U -z
Zstyle :vcs_info:* check-for-changes true

(…)

Zstyle :vcs_info:* get-revision false
Autoload add-zsh-hook with options -U -z
Zle -F 22_gitstatus_process_response_POWERLEVEL9K
Autoload_gitstatus_cleanup_15877_0_16212
Zle -N -- zle-line-pre-redraw _p9k_wrapper__p9k_zle_line_pre_redraw
Note: a new widget created via zle -N: zle-line-pre-redraw
Zle -N -- zle-keymap-select _p9k_wrapper__p9k_zle_keymap_select
Note: === Ended tracking function:_p9k_precmd ===

<span class="hljs-orange">Functions created:</span>
+vi-git-aheadbehind                      +vi-git-remotebranch

(…)
</code></pre>

#### Summary

As it can be seen, creation of four additional Zle-widgets has been recorded
(the `Zle -N …` lines). They will be properly deleted/restored on the plugin
unload with `MYPROMPT=3` (for example) and the shell state will be clean, ready
to load a new prompt.

### The `atload` Ice (and other `at…` ices) syntax

There are four code-receiving ices: `atclone`, `atpull`, `atinit`, `atload`.
Their role is to **receive a portion of Zsh code and execute it in certain
moments of the plugin life-cycle**. The **`atclone`** executes it:

- **after cloning** the associated plugin or snippet to the disk.

The **`atpull`** is similar, but works:

- **after updating** the associated plugin or snippet.

Next, **`atinit`** works similar, but is being activated:

- **before loading** of the associated plugin or snippet.

Last, **`atload`** is being activated:

- **after loading** of the associated plugin or snippet.

For convenience, you can use each of the ices multiple times in single `zi ice …` invocation – all the passed commands will be executed in the given order.

The `atpull` ice recognizes a special value: `%atclone` (so the code looks i.e.:
`atpull'%atclone'`). It causes the contents of the `atclone` ice to be copied
into the contents of the `atpull` ice. This is handy when the same tasks have to
be performed on clone **and** on update of plugin or snippet, like e.g.: in the
[**Direnv example**](../Direnv-explanation).

#### _Exclamation mark_-preceded `atload`

The `wrap-track` ice allows to track and unload plugins that defer their
initialization into a function run later after sourcing the plugin's script –
when the function is called, the plugin is then being fully initialized.
However, if the function is being called from the `atload` ice, then there is a
simpler method than the `wrap-track` ice – an _exclamation mark_-preceded
`atload` contents. The exclamation mark causes the effects of the execution of
the code passed to `atload` ice to be recorded.

#### Example

For example, in the following invocation:

```zsh
zi ice id-as'test' atload'!PATH+=:~/share'
zi load z-shell/null
```

the `$PATH` is being changed within `atload` ice. ZI's tracking records
`$PATH` changes and withdraws them on plugin unload, and also shows information
loading:

<pre><code>$ zplg report test
Report for test plugin
<span class="hljs-blue">----------------------</span>
Source  (reporting enabled)

<span class="hljs-orange">PATH elements added:</span>
/home/sg/share
</code></pre>

As it can be seen, the `atload` code is being correctly tracked and can be
unloaded & viewed. Below is the result of using the `unload` subcommand to
unload the `test` plugin:

<pre><code>$ zi unload test
<span class="hljs-blue">--- Unloading plugin: test ---</span>
Removing PATH element /home/sg/share
Unregistering plugin test
Plugin report saved to $LASTREPORT
</code></pre>

#### Practical example

The same example as in the [**Tracking precmd-based Plugins**](../wrap-track/)
article, but using the _exclamation mark_-preceded `atload` instead of
`wrap-track`:

```zsh
# Load when MYPROMPT == 4
zi ice load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' \
  atload'!source ~/.p10k.zsh; _p9k_precmd'
zi load romkatv/powerlevel10k
```

#### Summary

The creation of the four additional Zle-widgets will be recorded (see the
[**article**](../wrap-track) on `wrap-track` for more information) – the effect will
be exactly the same as with the `wrap-track` ice. The widgets will be properly
deleted/restored on the plugin unload with `MYPROMPT=3` (for example) and the
shell state will be clean, ready to load a new prompt.
