- [Plugins and snippets](#plugins-and-snippets)
- [Upgrade ZI and plugins](#upgrade-zi-and-plugins)
- [Turbo and lucid](#turbo-and-lucid)
  - [Turbo Mode](#turbo-mode)
  - [Lucid](#lucid)
- [Migration](#migration)
  - [Migration from Oh-My-ZSH](#migration-from-oh-my-zsh)
  - [Migration from Prezto](#migration-from-prezto)
  - [Migration from Zgen](#migration-from-zgen)
  - [Migration from Zplug](#migration-from-zplug)
- [More Examples](#more-examples)

---

[Click here to read the introduction to ZI](Introduction).
It explains basic usage and some of the more unique features of ZI such as the Turbo mode.
If you're new to ZI we highly recommend you read it at least once.

## Plugins and snippets

Plugins can be loaded using `load` or `light`.

```zsh
zi load  <repo/plugin> # Load with reporting/investigating.
zi light <repo/plugin> # Load without reporting/investigating.
```

If you want to source local or remote files (using direct URL), you can do so with `snippet`.

```zsh
zi snippet <URL>
```

Such lines should be added to `.zshrc`. Snippets are cached locally, use `-f` option to download
a fresh version of a snippet, or `zi update {URL}`. Can also use `zi update --all` to
update all snippets (and plugins).

**Example**

```zsh
# Plugin history-search-multi-word loaded with investigating.
zi load z-shell/H-S-MW

# Two regular plugins loaded without investigating.
zi light zsh-users/zsh-autosuggestions
zi light z-shell/F-Sy-H

# Snippet
zi snippet https://gist.githubusercontent.com/hightemp/5071909/raw/
```

**Prompt(Theme) Example**

This is [powerlevel10k](https://github.com/romkatv/powerlevel10k), [pure](https://github.com/sindresorhus/pure), [starship](https://github.com/starship/starship) sample:

```zsh
# Load powerlevel10k theme
zi ice depth"1" # git clone depth
zi light romkatv/powerlevel10k

# Load pure theme
zi ice pick"async.zsh" src"pure.zsh" # with the zsh-async library that's bundled with it.
zi light sindresorhus/pure

# Load starship theme
zi ice as"command" from"gh-r" \ # `starship` binary as command, from github release
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \ # starship setup at clone(create init.zsh, completion)
  atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zi light starship/starship
```

## Upgrade ZI and plugins

ZI can be updated to `self-update` and plugins to `update`.

```zsh
# Self-update
zi self-update
# Plugin update
zi update
# Plugin parallel update
zi update --parallel
# Increase the number of jobs in a concurrent set to 40
zi update --parallel 40
```

## Turbo and lucid

Turbo and lucid are the most used options.

### Turbo Mode

Turbo mode is the key to performance. It can be loaded asynchronously, which makes a huge difference when the amount of plugins increases.

Usually used as `zi ice wait"<SECONDS>"`, let's use the previous example:

```zsh
zi ice wait    # wait is same wait"0"
zi load z-shell/history-search-multi-word

zi ice wait"2" # load after 2 seconds
zi load z-shell/history-search-multi-word

zi ice wait    # also be used in `light` and `snippet`
zi snippet https://gist.githubusercontent.com/hightemp/5071909/raw/
```

### Lucid

Turbo mode is verbose, so you need an option for quiet.

You can use with `lucid`:

```zsh
zi ice wait lucid
zi load z-shell/history-search-multi-word
```

</details>

**_F&A:_** What is `ice`?

`ice` is Zi's options command. The option melts like ice and is used only once.
(more: [Ice Modifiers](Ice-modifiers)).

## Migration

### Migration from Oh-My-ZSH

**Basic**

```zsh
zi snippet <URL>        # Raw Syntax with URL
zi snippet OMZ::<PATH>  # Shorthand OMZ/ (http://github.com/ohmyzsh/ohmyzsh/raw/master/)
zi snippet OMZL::<PATH> # Shorthand OMZ/lib/
zi snippet OMZT::<PATH> # Shorthand OMZ/themes/
zi snippet OMZP::<PATH> # Shorthand OMZ/plugins/
```

**Library**

Importing the [clipboard](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh) and [termsupport](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/termsupport.zsh) Oh-My-Zsh Library Sample:

```zsh
# Raw Syntax
zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh
zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/termsupport.zsh

# OMZ Shorthand Syntax
zi snippet OMZ::lib/clipboard.zsh
zi snippet OMZ::lib/termsupport.zsh

# OMZL Shorthand Syntax
zi snippet OMZL::clipboard.zsh
zi snippet OMZL::termsupport.zsh
```

**Theme**

To use **themes** created for Oh My Zsh you might want to first source the `git` library there.

Then you can use the themes as snippets (`zi snippet <file path or GitHub URL>`).
Some themes require not only Oh My Zsh's Git **library**, but also Git **plugin** (error
about `current_branch` may appear). Load this Git-plugin as single-file
snippet directly from OMZ.

Most themes require the `promptsubst` option (`setopt promptsubst` in `zshrc`), if it isn't set, then
prompt will appear as something like: `... $(build_prompt) ...`.

You might want to suppress completions provided by the git plugin by issuing `zi cdclear -q`
(`-q` is for quiet) – see below **Ignoring Compdefs**.

To summarize:

```zsh
## Oh My Zsh Setting
ZSH_THEME="robbyrussell"

## ZI Setting
# Must Load OMZ Git library
zi snippet OMZL::git.zsh

# Load Git plugin from OMZ
zi snippet OMZP::git
zi cdclear -q # <- forget completions provided up to this moment

setopt promptsubst

# Load Prompt
zi snippet OMZT::robbyrussell
```

External Theme Sample: [NicoSantangelo/Alpharized](https://github.com/nicosantangelo/Alpharized)

```zsh
## Oh My Zsh Setting
ZSH_THEME="alpharized"

## ZI Setting
# Must Load OMZ Git library

zi snippet OMZL::git.zsh

# Load Git plugin from OMZ
zi snippet OMZP::git
zi cdclear -q # <- forget completions provided up to this moment

setopt promptsubst

# Load Prompt
zi light NicoSantangelo/Alpharized
```

**_F&A:_** Error occurs when loading OMZ's theme.

If the `git` library will not be loaded, then similar to following errors will be appearing:

```zsh
........:1: command not found: git_prompt_status
........:1: command not found: git_prompt_short_sha
```

**Plugin**

If it consists of a single file, you can just load it.

```zsh
## Oh-My-Zsh Setting
plugins=(
  git
  dotenv
  rake
  rbenv
  ruby
)

## ZI Setting
zi snippet OMZP::git
zi snippet OMZP::dotenv
zi snippet OMZP::rake
zi snippet OMZP::rbenv
zi snippet OMZP::ruby
```

Use `zi ice svn` if multiple files require an entire subdirectory.
Like [gitfast](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitfast), [osx](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/osx):

```zsh
zi ice svn
zi snippet OMZP::gitfast

zi ice svn
zi snippet OMZP::osx
```

Use `zi ice as"completion"` to directly add single file completion snippets.
Like [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker), [fd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fd):

```zsh
zi ice as"completion"
zi snippet OMZP::docker/_docker

zi ice as"completion"
zi snippet OMZP::fd/_fd
```

[You can see an extended explanation of Oh-My-Zsh setup in the Wiki](Oh-My-Zsh-Setup/)

### Migration from Prezto

**Basic**

```shell
zi snippet <URL>        # Raw Syntax with URL
zi snippet PZT::<PATH>  # Shorthand PZT/ (https://github.com/sorin-ionescu/prezto/tree/master/)
zi snippet PZTM::<PATH> # Shorthand PZT/modules/
```

**Modules**

Importing the [environment](https://github.com/sorin-ionescu/prezto/tree/master/modules/environment) and [terminal](https://github.com/sorin-ionescu/prezto/tree/master/modules/terminal) Prezto Modules Sample:

```zsh
## Prezto Setting
zstyle ':prezto:load' pmodule 'environment' 'terminal'

## ZI Setting
# Raw Syntax
zi snippet https://github.com/sorin-ionescu/prezto/blob/master/modules/environment/init.zsh
zi snippet https://github.com/sorin-ionescu/prezto/blob/master/modules/terminal/init.zsh

# PZT Shorthand Syntax
zi snippet PZT::modules/environment
zi snippet PZT::modules/terminal

# PZTM Shorthand Syntax
zi snippet PZTM::environment
zi snippet PZTM::terminal
```

Use `zi ice svn` if multiple files require an entire subdirectory.
Like [docker](https://github.com/sorin-ionescu/prezto/tree/master/modules/docker), [git](https://github.com/sorin-ionescu/prezto/tree/master/modules/git):

```zsh
zi ice svn
zi snippet PZTM::docker

zi ice svn
zi snippet PZTM::git
```

Use `zi ice as"null"` if don't exist `*.plugin.zsh`, `init.zsh`, `*.zsh-theme*` files in module.
Like [archive](https://github.com/sorin-ionescu/prezto/tree/master/modules/archive):

```zsh
zi ice svn as"null"
zi snippet PZTM::archive
```

Use `zi ice atclone"git clone <repo> <location>"` if module have external module.
Like [completion](https://github.com/sorin-ionescu/prezto/tree/master/modules/completion):

```shell
zi ice svn blockf \ # use blockf to prevent any unnecessary additions to fpath, as zi manages fpath
  atclone"git clone --recursive https://github.com/zsh-users/zsh-completions.git external"
zi snippet PZTM::completion
```

**_F&A:_** What is `zstyle`?

Read [zstyle](http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fzutil-Module) doc (more: [What does `zstyle` do?](https://unix.stackexchange.com/questions/214657/what-does-zstyle-do)).

### Migration from Zgen

**Oh My Zsh**

More reference: check **Migration from Oh-My-ZSH**

```zsh
# Load ohmyzsh base
zgen oh-my-zsh
zi snippet OMZL::<ALL OF THEM>

# Load ohmyzsh plugins
zgen oh-my-zsh <PATH>
zi snippet OMZ::<PATH>
```

**Prezto**

More reference: check **Migration from Prezto**

```zsh
# Load Prezto
zgen prezto
zi snippet PZTM::<COMMENT's List> # environment terminal editor history directory spectrum utility completion prompt

# Load prezto plugins
zgen prezto <modulename>
zi snippet PZTM::<modulename>

# Load a repo as Prezto plugins
zgen pmodule <reponame> <branch>
zi ice ver"<branch>"
zi load <repo/plugin>

# Set prezto options
zgen prezto <modulename> <option> <value(s)>
zstyle ':prezto:<modulename>:' <option> <values(s)> # Set original prezto style
```

**General**

`location`: refer [Selection of Files](Ices#the-src-ice)

```zsh
zgen load <repo> [location] [branch]

zi ice ver"[branch]"
zi load <repo>
```

### Migration from Zplug

**Basic**

```zsh
zplug <repo/plugin>, tag1:<option1>, tag2:<option2>

zi ice tag1"<option1>" tag2"<option2>"
zi load <repo/plugin>
```

**Tag comparison**

- `as` => `as`
- `use` => `pick`, `src`, `multisrc`
- `ignore` => None
- `from` => `from`
- `at` => `ver`
- `rename-to` => `mv`, `cp`
- `dir` => Selection(`pick`, ...) with rename
- `if` => `if`
- `hook-build` => `atclone`, `atpull`
- `hook-load` => `atload`
- `frozen` => None
- `on` => None
- `defer` => `wait`
- `lazy` => `autoload`
- `depth` => `depth`

## More Examples

After installing ZI you can start adding some actions (load some plugins) to `~/.zshrc`, at the bottom. Some examples:

```zsh
# Load the pure theme, with the zsh-async library that's bundled with it.
zi ice pick"async.zsh" src"pure.zsh"
zi light sindresorhus/pure

# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://github.com/z-shell/zi/wiki/Syntax/
zi for \
  light-mode  zsh-users/zsh-autosuggestions \
  light-mode  z-shell/fast-syntax-highlighting \
              z-shell/history-search-multi-word \
  light-mode pick"async.zsh" src"pure.zsh" \
    sindresorhus/pure

# Binary release in the archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zi ice from"gh-r" as"program"
zi light junegunn/fzf

# One other binary release, needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux, and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case, this is not needed, ZI will
# grep operating system name and architecture automatically when there's no `bpick'.
zi ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zi load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – ZI
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: https://github.com/z-shell/zi/wiki/Compiling-programs
zi ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
  atpull"%atclone" make pick"src/vim"
zi light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zi ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zi light tj/git-extras

# Handle completions without loading any plugin, see "clist" command.
# This one is to be run just once, in an interactive session.
zi creinstall %HOME/my_completions
```

```zsh
# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zi ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zi light trapd00r/LS_COLORS
```

```zsh
# make'!...' -> run make before atclone & atpull
zi ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zi light direnv/direnv
```

If you're interested in more examples then check out the [playground repository](https://github.com/z-shell/playground) where users have uploaded their
`~/.zshrc` and ZI configurations. Feel free to [submit](https://github.com/z-shell/playground/issues/new?template=request-to-add-zshrc-to-the-zi-configs-repo.md)
your `~/.zshrc` there if it contains ZI commands.

For some additional examples you can also check out the:

- [Gallery of Invocations](https://github.com/z-shell/zi/wiki/Gallery/),
- [Minimal Setup](https://github.com/z-shell/zi/wiki/Minimal-Setup/),
- [Oh-My-Zsh](https://github.com/z-shell/zi/wiki/Oh-My-Zsh-Setup/).
