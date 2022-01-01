<h2 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80" height="80">
  </a>
❮ ZI ❯ - Zsh Plugin Assessor
</h2>

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)


Plugins evaluated at January 01th, 2022

There are so many plugins on the great [awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins) page that
it makes sense to filter them out and also to **score** them. The plugins below
contain 50 or more commits and are **evaluated** by an automatic script in order
to detect:
 - ones with 100 or more commits
 - active ones
 - very active ones
 - maintained ones
 - ones having an ongoing research & development

Just take a look at the iconography. It's intuitive and easy to memorize. In
minutes you'll be able to grep interesting plugins with your eyes!
## Iconography

### Devoted time and work detection

🥇 - has 100 or more commits

### Progress detection

🚶- slow/moderate progress: 1 commit in each of last 3 months or 5 commits in total during the 3 last months (90 days)
🏃- fast progress: 2 commits in each of last 3 months or 10 commits in total during the 3 last months

### Maintenance detection

⌛️- long time no update (updated not in last 3 months, but in last 6 months)
⏳ - updated in last 3 months, active
⏰ - updated in last month and month before it (single new commit will not yield such a strong symbol like the alarm clock; the additional criterion ("month before it") is to take into account only a more constantly attended projects)

### Research & development detection

💼 - has branches with at least 50 commits in total
📈 – the branches were active 3 times in last 4 months

## Plugins (#127)

* [abbr (olets)](https://github.com/olets/zsh-abbr) :1st_place_medal: :alarm_clock: - Manages auto-expanding abbreviations that expand inline when you hit space, inspired by fish shell.
* [abbrev-alias](https://github.com/momo-lab/zsh-abbrev-alias) : :hourglass: - Provides functionality similar to `vim`'s abbreviation expansion.
* [alias-tips](https://github.com/djui/alias-tips) :1st_place_medal: - An oh-my-zsh plugin to help remembering those aliases you defined once.
* [allergen](https://github.com/stanislas/allergen) : :walking_man: :hourglass_flowing_sand: - A collection of custom ZSH plugins to use with Antigen.
* [ansiweather](https://github.com/fcambus/ansiweather) :1st_place_medal: :hourglass: - Weather in your terminal, with ANSI colors and Unicode symbols.
* [anyframe](https://github.com/mollifier/anyframe) : - A peco/percol/fzf wrapper plugin for ZSH.
* [atuin](https://github.com/ellie/atuin) :1st_place_medal: :alarm_clock: :running_man: - Replaces your existing shell history with a SQLite database, and records additional context for your commands. Additionally, it provides optional and fully encrypted synchronisation of your history between machines, via an Atuin server.
* [auto-fu.zsh](https://github.com/hchbaw/auto-fu.zsh) :1st_place_medal: :briefcase: - Automatic complete-word and list-choices. Originally incr-0.2.zsh by y.fujii <y-fujii at mimosa-pudica.net>.
* [auto-notify](https://github.com/MichaelAquilina/zsh-auto-notify) : - Automatically sends out a notification when a long running task has completed.
* [autocomplete](https://github.com/marlonrichert/zsh-autocomplete) :1st_place_medal: :alarm_clock: :running_man: - Automatically lists completions as you type and provides intuitive keybindings for selecting and inserting them.
* [autoenv-extended](https://github.com/zpm-zsh/autoenv) : :hourglass_flowing_sand: - Extended version of the [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv) plugin.
* [autoenv](https://github.com/Tarrasch/zsh-autoenv) :1st_place_medal: - If a directory contains a `.env` file, it will automatically be executed when you `cd` into it.
* [autojump](https://github.com/wting/autojump) :1st_place_medal: - A `cd` command that learns - easily navigate directories from the command line. Install autojump-zsh for best results.
* [autopair](https://github.com/hlissner/zsh-autopair) : - A ZSH plugin for auto-closing, deleting and skipping over matching delimiters. Only tested on ZSH 5.0.2 or later.
* [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) :1st_place_medal: - [Fish](https://fishshell.com/)-like fast/unobtrusive autosuggestions for ZSH.
* [autoswitch-virtualenv](https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv) :1st_place_medal: :running_man: :hourglass_flowing_sand: - ZSH plugin to automatically switch python virtualenvs and pipenvs when traversing directories. Automatically detects pipenv and poetry projects.
* [base16](https://github.com/chriskempson/base16-shell) :1st_place_medal: - Adds script to allow you to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible to honor the original bright colors of your shell (e.g. bright green is still green and so on) while providing additional base16 colors to applications such as [Vim](https://www.vim.org).
* [bitwarden](https://github.com/Game4Move78/zsh-bitwarden) : :running_man: :hourglass_flowing_sand: - Adds functions to manage [bitwarden](https://bitwarden.com/) sessions.
* [blackbox](https://github.com/StackExchange/blackbox) :1st_place_medal: :briefcase: - [Stack Exchange](https://stackexchange.com)'s toolkit for storing keys/credentials securely in a `git` repository.
* [cdc](https://github.com/evanthegrayt/cdc) : - Makes it easier to change directories to directories that are subdirs of a user-defined list of directories. Includes tab-completion, session history and `pushd`, `popd` and `dirs` equivalents.
* [czhttpd](https://github.com/jsks/czhttpd) :1st_place_medal: :hourglass: - A simple http server written in 99.9% pure ZSH.
* [deer](https://github.com/Vifon/deer) :1st_place_medal: - A file navigator for ZSH heavily inspired by [ranger](https://ranger.github.io/).
* [depot-tools](https://github.com/kuoe0/zsh-depot-tools) :1st_place_medal: - Simple oh-my-zsh plugin for installing the chromium depot_tools. Installing this plugin will put all of the chromium depot_tools in your path automatically.
* [diractions](https://github.com/AdrieanKhisbe/diractions) :1st_place_medal: - Allow you to map a short logical/mnemonic name to directories to quickly access them, or perform actions in them.
* [directory-history](https://github.com/tymm/zsh-directory-history) : - A per directory history for ZSH which implements forward/backward navigation as well as substring search in a directory sensitive manner.
* [dirrc](https://github.com/gmatheu/shell-plugins) : :hourglass: - Executes `.dirc` when present in a directory you `cd` into.
* [docker-aliases](https://github.com/webyneter/docker-aliases) : Docker aliases for everyday use.
* [docker-helpers](https://github.com/unixorn/docker-helpers.zshplugin) : :hourglass_flowing_sand: - A collection of docker helper scripts.
* [dotbare](https://github.com/kazhala/dotbare) :1st_place_medal: :hourglass: - Interactive dotfile management with the help of `fzf`.
* [dwim](https://github.com/oknowton/zsh-dwim) : - Attempts to predict what you will want to do next. It provides a key binding (control-u) that will replace the current (or previous) command line with the command you will want to run next.
* [easy-motion](https://github.com/IngoHeimbach/zsh-easy-motion) : - A port of [vim-easymotion](https://github.com/easymotion/vim-easymotion) for ZSH.
* [editing-workbench](https://github.com/commiyou/zsh-editing-workbench) : - Adds sane, complex command line editing (e.g. incremental history word completion).
* [elixir](https://github.com/gusaiani/elixir-oh-my-zsh) : - Adds shortcuts for Elixir, IEX, Mix, Kiex and Phoenix.
* [enhancd](https://github.com/b4b4r07/enhancd) :1st_place_medal: - A simple tool that provides an enhanced `cd` command by memorizing all directories visited by a user and use it for the pathname resolution.
* [evil-registers](https://github.com/zsh-vi-more/evil-registers) :1st_place_medal: :hourglass: - Extends ZLE vi commands to remotely access named registers of the vim and nvim editors, and system selection and clipboard.
* [expand](https://github.com/MenkeTechnologies/zsh-expand) :1st_place_medal: :alarm_clock: :running_man: - Expands regular aliases, global aliases, incorrect spellings and phrases, globs, history expansion and $parameters with the spacebar key.
* [explain-shell](https://github.com/gmatheu/shell-plugins) : :hourglass: - Opens commands on [explainshell.com](https://explainshell.com).
* [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) :1st_place_medal: :running_man: :hourglass_flowing_sand: - Optimized and improved `zsh-users/zsh-syntax-highlighting` – better response times, switchable highlight themes.
* [forgit](https://github.com/wfxr/forgit) :1st_place_medal: :alarm_clock: :running_man: - Utility tool for `git` which takes advantage of fuzzy finder [fzf](https://github.com/junegunn/fzf).
* [functional](https://github.com/Tarrasch/zsh-functional) : - ZSH higher order functions.
* [fz](https://github.com/changyuheng/fz) : :hourglass_flowing_sand: - Seamlessly adds fuzzy search to [z](https://github.com/rupa/z)'s tab completion and lets you easily jump around among directories in your history.
* [fzf-marks](https://github.com/urbainvaes/fzf-marks) :1st_place_medal: :hourglass_flowing_sand: - Little script to create, navigate and delete bookmarks in `bash` and `zsh`, using the fuzzy finder [fzf](https://github.com/junegunn/fzf).
* [fzf-tab](https://github.com/Aloxaf/fzf-tab) :1st_place_medal: :alarm_clock: :walking_man: - Replace ZSH's default completion selection menu with [fzf](https://github.com/junegunn/fzf).
* [fzf-widgets](https://github.com/ytet5uy4/fzf-widgets) :1st_place_medal: - Adds some ZLE widgets for [fzf](https://github.com/junegunn/fzf).
* [fzf-z](https://github.com/andrewferrier/fzf-z) : - Brings together the *z* plugin and *fzf* to allow you to easily browse recently used directories at any point on the command line.
* [gdbm](https://github.com/zdharma-continuum/zgdbm) : :hourglass_flowing_sand: - Adds GDBM as a plugin.
* [git-acp](https://github.com/MenkeTechnologies/zsh-git-acp) : :hourglass: - Take the current command line as the commit message and then run git pull, add, commit and push with one keystroke.
* [git-aliases (mdumitru)](https://github.com/mdumitru/git-aliases) : - Broken out version of the version in [oh-my-zsh](http://ohmyz.sh/) so users of other frameworks don't have to import all of oh-my-zsh.
* [git-aliases.zsh](https://github.com/peterhurford/git-aliases.zsh) : - Creates a lot of useful aliases for combinations of commonly used `git` commands.
* [git-extra-commands](https://github.com/unixorn/git-extra-commands) :1st_place_medal: :running_man: :hourglass_flowing_sand: - Extra `git` helper scripts packaged as a plugin.
* [git-fuzzy](https://github.com/bigH/git-fuzzy) : :hourglass: - A CLI interface to `git` that relies heavily on [`fzf`](https://github.com/junegunn/fzf).
* [git-it-on](https://github.com/peterhurford/git-it-on.zsh) : - Adds ability to open a folder in your current branch on GitHub.
* [git-secret](https://github.com/sobolevn/git-secret) :1st_place_medal: :alarm_clock: :running_man: :briefcase: - A bash-tool to store your private data inside a `git` repository.
* [gitignore](https://github.com/voronkovich/gitignore.plugin.zsh) :1st_place_medal: :hourglass_flowing_sand: - Plugin for creating `.gitignore` files.
* [gitsync](https://github.com/washtubs/gitsync) : - ZSH plugin to improve workflows for one person developing on the same repository on multiple machines.
* [grep2awk](https://github.com/joepvd/grep2awk) : - ZLE widget to transform `grep` command into `awk` command.
* [gunstage](https://github.com/LucasLarson/gunstage) :1st_place_medal: :alarm_clock: :running_man: - There are at least eight ways to unstage files in a `git` repository. This is a command-line shell plugin for undoing `git add`.
* [hist](https://github.com/marlonrichert/zsh-hist) : :hourglass_flowing_sand: - Edit your history in ZSH, without ever leaving the command line.
* [histdb](https://github.com/larkery/zsh-histdb) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - Stores your history in an SQLite database. Can be integrated with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
* [history-enquirer](https://github.com/zthxxx/zsh-history-enquirer) : :walking_man: :hourglass_flowing_sand: - Enhances history search with more interaction and a multiline selection menu. Requires nodejs.
* [history-search-multi-word](https://github.com/zdharma-continuum/history-search-multi-word) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - A syntax highlighted, multi-word history searcher for ZSH, bound to Ctrl-R, with advanced functions (e.g. bump of history entry to top of history).
* [history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) :1st_place_medal: :hourglass: - Needs to be loaded after `zsh-syntax-highlighting`, or they'll both break. You'll also need to bind keys to its functions, details are in the README.md.
* [history-sync](https://github.com/wulfgarpro/history-sync) : - An Oh My Zsh plugin for GPG encrypted, Internet synchronized ZSH history using `git`.
* [instant-repl](https://github.com/jandamm/instant-repl.zsh) : - Activate a REPL for any command in your current ZSH session.
* [iterm-touchbar](https://github.com/iam4x/zsh-iterm-touchbar) : - Display iTerm2 feedback in the MacbookPro TouchBar (Current directory, git branch & status).
* [jhipster](https://github.com/jhipster/jhipster-oh-my-zsh-plugin) : - Adds commands for [jHipster](https://www.jhipster.tech/).
* [k](https://github.com/supercrabtree/k) :1st_place_medal: :briefcase: - Directory listings for ZSH with `git` status decorations.
* [kube-aliases](https://github.com/Dbz/kube-aliases) : :hourglass: :briefcase: :chart_with_upwards_trend: - Adds functions and aliases to make working with `kubectl` more pleasant.
* [kube-ps1](https://github.com/jonmosco/kube-ps1) :1st_place_medal: :hourglass: - ZSH plugin for `kubectl` that adds current context and namespace.
* [kubernetes](https://github.com/Dbz/zsh-kubernetes) : :hourglass: :briefcase: :chart_with_upwards_trend: - Add [kubernetes](https://kubernetes.io) helper functions and aliases.
* [learn](https://github.com/MenkeTechnologies/zsh-learn) : :hourglass: - Learning collection in MySQL/MariadB to save, query and quiz everything you learn.
* [liferay](https://github.com/david-gutierrez-mesa/liferay-zsh) :1st_place_medal: :alarm_clock: :running_man: - Adds scripts for [liferay](https://github.com/liferay/liferay-portal) development.
* [morpho](https://github.com/Jacke/zsh-morpho) : - Terminal screen savers written in pure ZSH, and also screen saver framework.
* [navigation-tools](https://github.com/zdharma-continuum/zsh-navigation-tools) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - Adds `htop`-like kill, directory bookmarks browser, a multi-word incremental history searcher and more.
* [new-file-from-template](https://github.com/zpm-zsh/new-file-from-template) : -  Generates file from template.
* [nix-shell](https://github.com/chisui/zsh-nix-shell) : :hourglass: - Plugin that lets you use ZSH as the default shell in a `nix-shell` environment.
* [notify (luismayta)](https://github.com/luismayta/zsh-notify) :1st_place_medal: :alarm_clock: :running_man: - Notifications for ZSH with auto installation of dependencies and r2d2 sounds.
* [notify (marzocchi)](https://github.com/marzocchi/zsh-notify) : - A plugin for ZSH (on macOS and Linux) that posts desktop notifications when a command terminates with a non-zero exit status or when it took more than 30 seconds to complete, if the terminal application is in the background (or the command's terminal tab is inactive).
* [nvm](https://github.com/lukechilds/zsh-nvm) :1st_place_medal: :briefcase: - ZSH plugin for installing, updating and loading `nvm`.
* [open-pr](https://github.com/caarlos0/zsh-open-pr) : - A ZSH plugin to open pull requests from command line.
* [opp](https://github.com/hchbaw/opp.zsh) : - Vim's text-objects-ish for ZSH.
* [path-ethic](https://github.com/sha1n/path-ethic) : :hourglass: - Helps manage your `$PATH` quickly and easily. Doesn't touch your existing `.zshrc`, `.zprofile`, but adds on top of your existing environment instead.
* [pentest](https://github.com/jhwohlgemuth/oh-my-zsh-pentest-plugin) : - Aliases and functions for the lazy penetration tester.
* [ph-marks](https://github.com/lainiwa/ph-marks) : - Bookmark pornhub videos from your terminal.
* [posh-git-bash](https://github.com/lyze/posh-git-sh) : :hourglass: - Adds `git` status in your prompt.
* [pr-cwd](https://github.com/zpm-zsh/pr-cwd) : - Creates a global variable with current working directory. Plugin has integration with [jocelynmallon/zshmarks](https://github.com/jocelynmallon/zshmarks).
* [pr-git](https://github.com/zpm-zsh/pr-git) : - Creates a global variable with `git` status information that can be displayed in prompts.
* [profile-secrets](https://github.com/gmatheu/shell-plugins) : :hourglass: - Securely keep sensitive variables (api tokens, passwords, etc) as part of your terminal init files. Uses gpg to encrypt/decrypt the file with your secrets.
* [project (gko)](https://github.com/gko/project) : - Create node/python/ruby project both locally and on github(private or public repository).
* [sealion](https://github.com/xyproto/sealion) : :alarm_clock: :running_man: - Allows you to set reminders that will appear in your terminal when your prompt is refreshed.
* [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) :1st_place_medal: :hourglass_flowing_sand: - Add syntax highlighting to your ZSH. Make sure you load this _before_ zsh-users/zsh-history-substring-search or they will both break.
* [sysadmin-util](https://github.com/skx/sysadmin-util) :1st_place_medal: - Steve Kemp's collection of tool scripts for sysadmins.
* [system-clipboard](https://github.com/kutsan/zsh-system-clipboard) :1st_place_medal: :alarm_clock: - Adds key bindings support for ZLE (Zsh Line Editor) clipboard operations for vi emulation keymaps. It works under Linux, macOS and Android (via Termux).
* [tig](https://github.com/MenkeTechnologies/zsh-tig-plugin) : :hourglass_flowing_sand: - Adds a few advanced bindings for [tig](https://github.com/jonas/tig) and also provides a `tig-pick` script.
* [tmux-zsh-vim-titles](https://github.com/MikeDacre/tmux-zsh-vim-titles) : :hourglass_flowing_sand: - Create unified terminal titles for `tmux`, ZSH, and Vim/NVIM, modular.
* [tmux](https://github.com/zpm-zsh/tmux) : :hourglass_flowing_sand: - Plugin for [tmux](https://tmux.github.io).
* [tsm](https://github.com/RobertAudi/tsm) : - Adds a [tmux](https://tmux.github.io) Session Manager.
* [tumult](https://github.com/unixorn/tumult.plugin.zsh) :1st_place_medal: :running_man: :hourglass_flowing_sand: - Adds tools for macOS.
* [ugit](https://github.com/Bhupesh-V/ugit) : :hourglass_flowing_sand: - Lets you undo your last `git` operation.
* [vi-increment](https://github.com/zsh-vi-more/vi-increment) : :hourglass: - Add `vim`-like increment/decrement operations.
* [vi-mode (jeffreytse)](https://github.com/jeffreytse/zsh-vi-mode) :1st_place_medal: :alarm_clock: :running_man: - 💻 A better and friendly vi(vim) mode plugin for ZSH.
* [vi-motions](https://github.com/zsh-vi-more/vi-motions) : - Add new motions and text objects including quoted/bracketed text and commands.
* [vim-mode](https://github.com/softmoth/zsh-vim-mode) : - Friendly `vi`-mode bindings, adding basic Emacs keys, incremental search, mode indicators and more.
* [wakatime (wbingli)](https://github.com/wbingli/zsh-wakatime) : - Automatic time tracking for commands in ZSH using [wakatime](https://wakatime.com/).
* [wd](https://github.com/mfaerevaag/wd) :1st_place_medal: - Warp directory lets you jump to custom directories in ZSH, without using `cd`. Why? Because `cd` seems inefficient when the folder is frequently visited or has a long path.
* [yeoman](https://github.com/edouard-lopez/yeoman-zsh-plugin) : - Edouard Lopez's Yeoman plugin for oh-my-zsh, compatible with yeoman version ≥1.0 (includes options and command auto-completion).
* [you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use) :1st_place_medal: :hourglass_flowing_sand: - ZSH plugin that reminds you to use those aliases you defined.
* [z.lua](https://github.com/skywind3000/z.lua) :1st_place_medal: :hourglass_flowing_sand: - A command line tool which helps you navigate faster by learning your habits. An alternative to [z.sh](https://github.com/rupa/z) with Windows and posix shells support and various improvements. 10x faster than fasd and autojump, 3x faster than [z.sh](https://github.com/rupa/z).
* [zaw](https://github.com/zsh-users/zaw) :1st_place_medal: - ZSH anything.el-like widget.
* [zbrowse](https://github.com/zdharma-continuum/zbrowse) : :walking_man: :hourglass_flowing_sand: - When doing shell work, it is often the case that echo $variable is invoked multiple times, to check the result of a loop, etc. With ZBrowse, you just need to press `Ctrl-B`, which invokes the ZBrowse – Zshell variable browser.
* [zcolors](https://github.com/marlonrichert/zcolors) : :alarm_clock: :running_man: - Uses your `$LS_COLORS` to generate a coherent theme for Git and your Zsh prompt, completions and [ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
* [zconvey](https://github.com/zdharma-continuum/zconvey) :1st_place_medal: :hourglass_flowing_sand: - Adds ability to send commands to other ZSH sessions, you can use this to `cd $PWD` on all active ZSH sessions, for example.
* [zeno](https://github.com/yuki-yano/zeno.zsh) :1st_place_medal: :alarm_clock: :running_man: - Fuzzy completion and utility plugin powered by [Deno](https://deno.land/).
* [zero](https://github.com/arlimus/zero.zsh) :1st_place_medal: - Zero's theme & plugin. Has variants for both light and dark terminal backgrounds.
* [zflai](https://github.com/zdharma-continuum/zflai) : :hourglass_flowing_sand: - A fast logging framework for ZSH.
* [zinit-annex-bin-gem-node](https://github.com/zdharma-continuum/zinit-annex-bin-gem-node) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - [zinit](https://github.com/zdharma-continuum/zinit) extension that exposes binaries without altering `$PATH`, installs Ruby gems and Node modules and easily exposes their binaries, and updates the gems and modules when the associated plugin or snippet is updated.
* [zinit-annex-man](https://github.com/zdharma-continuum/zinit-annex-man) : :walking_man: :hourglass_flowing_sand: - [Zinit](https://github.com/zdharma-continuum/zinit) extension that generates man pages for all plugins and snippets
* [zinit-annex-meta-plugins](https://github.com/zdharma-continuum/zinit-annex-meta-plugins) : :running_man: :hourglass_flowing_sand: - Install groups of plugins with a single label ([zinit](https://github.com/zdharma-continuum/zinit) only).
* [zinit-annex-readurl](https://github.com/zdharma-continuum/zinit-annex-readurl) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - Adds function to automatically download the newest version of a file to which URL is hosted on a webpage.
* [zinit-annex-rust](https://github.com/zdharma-continuum/zinit-annex-rust) : :walking_man: :hourglass_flowing_sand: - [zinit](https://github.com/zdharma-continuum/zinit) extension that that installs rust and cargo packages inside plugin directories.
* [zinit-annex-unscope](https://github.com/zdharma-continuum/zinit-annex-unscope) : :running_man: :hourglass_flowing_sand: - Allows installing plugins for [zinit](https://github.com/zdharma-continuum/zinit) without specifying the user name by querying the Github API.
* [zoxide](https://github.com/ajeetdsouza/zoxide) :1st_place_medal: :alarm_clock: :running_man: - A fast alternative to `cd` that learns your habits.
* [zredis](https://github.com/zdharma-continuum/zredis) :1st_place_medal: :hourglass_flowing_sand: - Adds Redis database support, with `database_key` <-> `shell_variable` binding. Supports all data types.
* [zsh-in-docker](https://github.com/deluan/zsh-in-docker) : :walking_man: :hourglass_flowing_sand: - Automates ZSH + Oh-My-ZSH installation into development containers. Works with Alpine, Ubuntu, Debian, CentOS or Amazon Linux.
* [zsh-z (agkozak)](https://github.com/agkozak/zsh-z) :1st_place_medal: :alarm_clock: :running_man: - Jump quickly to directories that you have visited "frecently." A native ZSH port of `z.sh` - without `awk`, `sed`, `sort`, or `date`.
* [zshmarks](https://github.com/jocelynmallon/zshmarks) : - A port of Bashmarks (by Todd Werth), a simple command line bookmarking plugin, for oh-my-zsh.
* [zui](https://github.com/zdharma-continuum/zui) :1st_place_medal: :hourglass_flowing_sand: - ZSH User Interface library – CGI+DHTML-like rapid TUI application development with ZSH.)

## Themes (#89)

* [agkozak](https://github.com/agkozak/agkozak-zsh-prompt) :1st_place_medal: :running_man: :hourglass_flowing_sand: :briefcase: :chart_with_upwards_trend: - Uses three asynchronous methods to keep the ZSH prompt responsive while displaying the `git` status and indicators of SSH connection, exit codes, and `vi` mode, along with an abbreviated, `PROMPT_DIRTRIM`-style path. Very customizable. Asynchronous even on Cygwin and MSYS2.
* [agnoster-j](https://github.com/apjanke/agnosterj-zsh-theme) :1st_place_medal: - Optimized for [solarized](https://ethanschoonover.com/solarized/) color scheme, `git` or other VCS tools, and unicode-compatible fonts. Includes status of last command run, user@hostname, `git` status decorations, working directory, whether running as root, whether background jobs are running, and other information.
* [alien-minimal](https://github.com/eendroroy/alien-minimal) :1st_place_medal: - Minimalist ZSH theme with `git` status displayed.
* [alien](https://github.com/eendroroy/alien) :1st_place_medal: - Powerline-esque ZSH theme that shows `git` decorations and the exit code of the last command. Faster than many other prompts because it determines the `git` decorations asynchronously in a background process.
* [almel](https://github.com/Ryooooooga/almel) :1st_place_medal: :hourglass_flowing_sand: - Inspired by [agnoster](https://github.com/agnoster/agnoster-zsh-theme), written in Rust. Includes `git` status, user@host, last command exit status and working directory decorations
* [apollo](https://github.com/mjrafferty/apollo-zsh-theme) :1st_place_medal: :hourglass_flowing_sand: - A heavily customizable, compatible and performant ZSH theme that uses modules to enable features.
* [astral](https://github.com/xwmx/astral) :1st_place_medal: - Theme for dark backgrounds with zen mode. Works well with the zsh-users [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugin.
* [aterminal](https://github.com/guiferpa/aterminal) : - Displays Nodejs, NPM, Docker, Go, Python, Elixir and Ruby information in the prompt.
* [bar (xp-bar)](https://github.com/xp-bar/zsh-bar-theme) : - Includes username, host, pwd, `git` status decorations and  3x hour reminders to drink water.
* [bklyn](https://github.com/gporrata/bklyn-zsh) :1st_place_medal: - Variant of [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) with customizations applied.
* [black-Void](https://github.com/black7375/BlaCk-Void-Zsh) :1st_place_medal: :alarm_clock: :walking_man: :briefcase: :chart_with_upwards_trend: - Includes account info, root user, using ssh, directory lotation, write permission, vcs info decorations.
* [blox](https://github.com/yardnsm/blox-zsh-theme) : :alarm_clock: - A minimal and fast ZSH theme that shows you what you need. It consists of blocks: each block is shown inside a pair of \[square brackets\], and you can add blocks by simply creating a function.
* [bronze](https://github.com/reujab/bronze) :1st_place_medal: - A cross-shell customizable powerline-like prompt with icons written in go. Requires [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
* [bullet-train](https://github.com/caiogondim/bullet-train.zsh) :1st_place_medal: - Inspired by the Powerline Vim plugin. It aims for simplicity, showing information only when it's relevant.
* [chaffee](https://github.com/jasonchaffee/chaffee.zsh-theme) : - Based on sorin. Shows the current active versions of Java, Scala, Go, Node, Python and Ruby.
* [clean (brandonRoehl)](https://github.com/BrandonRoehl/zsh-clean) :1st_place_medal: - A minimalist variant of [pure](https://github.com/sindresorhus/pure). Pure is not clean, clean is not pure.
* [czsh](https://github.com/Cellophan/czsh) :1st_place_medal: :alarm_clock: :running_man: - [ZSH](https://en.wikipedia.org/wiki/Z_shell) with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) and the [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme in a container.
* [dracula](https://github.com/dracula/zsh) :1st_place_medal: :hourglass: - A dark theme for Atom, Alfred, Chrome DevTools, iTerm 2, Sublime Text, Textmate, Terminal.app, Vim, Xcode, and ZSH.
* [filthy](https://github.com/molovo/filthy) : - A disgustingly clean ZSH prompt.
* [fishy-lite](https://github.com/sudorook/fishy-lite) : :hourglass_flowing_sand: - Fork of the original [fishy](https://github.com/ohmyzsh/ohmyzsh/wiki/themes#fishy) theme in oh-my-zsh with much of the extraneous stuff cut out to improve load speeds. Includes a battery gauge and `git` status display that can be enabled on the right-hand side of the prompt.
* [garrett](https://github.com/chauncey-garrett/zsh-prompt-garrett) : - Prezto prompt with the information you need the moment you need it.
* [gbt](https://github.com/jtyr/gbt) :1st_place_medal: - Go Bullet Train is a very customizable prompt builder inspired by Bullet Train that runs much faster. Includes many different status cars.
* [geometry](https://github.com/geometry-zsh/geometry) :1st_place_medal: :hourglass: - A minimal ZSH theme where any function can be added to the left prompt or (async) right prompt on the fly.
* [git-prompt (awgn)](https://github.com/awgn/git-prompt) :1st_place_medal: :hourglass_flowing_sand: - A fast `git` prompt for `bash`, `zsh` and `fish`.
* [git-prompt (olivierverdier)](https://github.com/olivierverdier/zsh-git-prompt) :1st_place_medal: - Displays information about the current `git` repository. In particular the branch name, difference with remote branch, number of files staged or changed, etc.
* [git-prompt (woefe)](https://github.com/woefe/git-prompt.zsh) : :hourglass_flowing_sand: - A fast, customizable, pure-shell, asynchronous Git prompt for ZSH heavily inspired by Olivier Verdier's [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) and very similar to the "Informative VCS" prompt of fish shell.
* [gops](https://github.com/noxer/gops) : :walking_man: :hourglass_flowing_sand: - Fast powerline-like prompt. Includes `git` status, current directory, root status decorations.
* [guezwhoz](https://github.com/guesswhozzz/guezwhoz-zshell) : - Minimalist, includes `git` status decorations.
* [hyperzsh](https://github.com/tylerreckart/hyperzsh) : - Gives you a comprehensive overview of the branch you're working on and the status of your repository without cluttering your terminal.
* [infoline](https://github.com/hevi9/infoline-zsh-theme) : - Clean theme that shows `git` status, background jobs, remote host, and other information.
* [itg](https://github.com/itsthatguy/itg.zsh-theme) : - itsthatguy's theme.
* [jovial](https://github.com/zthxxx/jovial) :1st_place_medal: :running_man: :hourglass_flowing_sand: - Shows host, user, path, development environment, `git` branch, which python venv is active.
* [jwalter](https://github.com/jeffwalter/zsh-jwalter) : - Powerline-style theme with `git`, `svn`, `npm`, `rvm` and network awareness. Requires Powerline-compatible terminal font.
* [kali](https://github.com/h4ck3r0/kali-theme) : - Includes `git` decorations.
* [kiss](https://github.com/rileytwo/kiss) :1st_place_medal: - Simple theme for oh-my-zsh, VSCode, iTerm2, Neovim, and RStudio. Includes `git` status decorations.
* [lambda-pure](https://github.com/marszall87/lambda-pure) :1st_place_medal: - A minimal ZSH theme, based on Pure, with added NodeJS version.
* [lean](https://github.com/miekg/lean) : :hourglass_flowing_sand: - Inspired by [pure](https://github.com/sindresorhus/pure). Includes `git` status and background job decorations.
* [lemon](https://github.com/carlosvitr/lemon_zsh) : :hourglass: - Many beautiful colors for you to enjoy. done with care and patience. Includes `git` status and ruby version decorations.
* [liquidprompt](https://github.com/nojhan/liquidprompt) :1st_place_medal: :alarm_clock: :running_man: :briefcase: - A full-featured & carefully designed adaptive prompt with useful information when you need it. It shows you what you need when you need it. You will notice what changes when it changes, saving time and frustration.
* [materialshell](https://github.com/carloscuesta/materialshell) : - A [material design](https://material.io/guidelines/style/color.html) theme for your shell with a good contrast and color pops at the important parts. Designed to be easy on the eyes.
* [minimal (glsorre)](https://github.com/glsorre/minimal/) : - minimal asynchronous ZSH theme optimized for use with the [Fira Code](https://github.com/tonsky/FiraCode) font and the [Solarized Light](https://ethanschoonover.com/solarized) terminal theme.
* [minimal (subnixr)](https://github.com/subnixr/minimal) : :hourglass_flowing_sand: - Minimal yet feature-rich theme.
* [minimal2](https://github.com/PatTheMav/minimal2) : - A minimal and extensible ZSH theme. Forked from [subnixr's original](https://github.com/subnixr/minimal) and adapted for [Zimfw](https://github.com/zimfw/zimfw).
* [newt](https://github.com/softmoth/zsh-prompt-newt) : - Fat & fast theme – beautiful inside and out, styled segments done right. Extremely customizable, includes `git`, username, execution time, directory, background jobs and edit mode decorations.
* [nox](https://github.com/kbrsh/nox) :1st_place_medal: :hourglass: - Dark theme, displays the current working directory and git status.
* [odin](https://github.com/tylerreckart/odin) : - Odin is a `git`-flavored ZSH theme.
* [oh-my-git](https://github.com/arialdomartini/oh-my-git) :1st_place_medal: - An opinionated prompt for bash and ZSH.
* [oh-my-via](https://github.com/badouralix/oh-my-via) : - Theme for ZSH which mainly forks the historical theme used on VIA servers.
* [persi](https://github.com/persiliao/persi-zsh-theme) :1st_place_medal: :hourglass_flowing_sand: - Includes `git` decorations. Works with both light and dark backgrounds.
* [polyglot](https://github.com/agkozak/polyglot) :1st_place_medal: :hourglass_flowing_sand: - a dynamic prompt for `zsh`, `bash`, `ksh93`, `mksh`, `pdksh`, `dash`, and busybox `ash` that uses basic ASCII symbols (and color, when possible) to show username, whether it is a local or remote `ssh` sesssion, abbreviated path, `git` branch and status, exit status of last command if non-zero, any virtual environment created with `virtualenv`, `venv`, `pipenv`, `poetry`, or `conda`.
* [poncho](https://github.com/RainyDayMedia/oh-my-zsh-poncho) : - RDM's basic oh-my-zsh custom theme.
* [powerless](https://github.com/martinrotter/powerless) :1st_place_medal: - Tiny & simple pure ZSH prompt inspired by powerline.
* [powerlevel10k](https://github.com/romkatv/powerlevel10k) :1st_place_medal: :alarm_clock: :running_man: - A fast reimplementation of [powerlevel9k](https://github.com/bhilburn/powerlevel9k) ZSH theme. Can be used as a drop-in replacement for powerlevel9k, when given the same configuration options it will generate the same prompt, only faster.
* [powerlevel9k](https://github.com/bhilburn/powerlevel9k) :1st_place_medal: :briefcase: - Powerlevel9k is a theme for ZSH which uses [Powerline Fonts](https://github.com/powerline/fonts). It can be used with vanilla ZSH or ZSH frameworks such as [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh), [Prezto](https://github.com/sorin-ionescu/prezto), [Antigen](https://github.com/zsh-users/antigen), and [many others](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions).
* [powerline (jeremy)](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme) : - Another take on a powerline theme. Nicely configurable, but requires at least a 256 color-capable terminal with a powerline-compatible terminal font.
* [powerline-go](https://github.com/justjanne/powerline-go) :1st_place_medal: :hourglass_flowing_sand: - A beautiful and useful low-latency prompt, written in golang. Includes `git` and `hg` status decorations, exit status of the last command run, current Python virtualenv, whether you're in a [nix](https://nixos.org/) shell, and is easy to extend.
* [powerline-hs](https://github.com/rdnetto/powerline-hs) :1st_place_medal: - A [Powerline](https://github.com/powerline/powerline) clone written in Haskell. It is significantly faster than the original implementation, and makes the shell noticeably more responsive.
* [powerline-pills](https://github.com/lucasqueiroz/powerline-pills-zsh) : - Created in Ruby, uses powerline characters to simulate pills with useful information.
* [powerline-shell (b-ryan)](https://github.com/b-ryan/powerline-shell) :1st_place_medal: - Beautiful and useful prompt generator for Bash, ZSH, Fish, and tcsh. Includes `git`, `svn`, `fossil` and `hg` decorations, Python virtualenv information, and last command exit status.
* [powerline-shell (banga)](https://github.com/b-ryan/powerline-shell) :1st_place_medal: - A [powerline](https://github.com/Lokaltog/vim-powerline)-like prompt for Bash, ZSH and Fish. Shows important details about git/svn/hg/fossil branch and is easy to customize/extend.
* [powerline-train](https://github.com/sherubthakur/powerline-train) : - A powerline variant.
* [prompt_j2](https://github.com/malinoskj2/prompt_j2) : :hourglass_flowing_sand: - Has a dynamic exit status indicator, can change to two lines dynamically to display context.
* [pure-agnoster](https://github.com/yourfin/pure-agnoster) :1st_place_medal: - Mashup of pure and agnoster. Has `git` decorations and works well with both dark and light terminal backgrounds.
* [pure](https://github.com/sindresorhus/pure) :1st_place_medal: :hourglass_flowing_sand: - A pretty, minimal and fast ZSH prompt. Includes `git` status decorations, prompt turns red if last command failed, username and host decorations when in a remote session or container, and current folder and command when a process is running.
* [purify (banminkyoz)](https://github.com/banminkyoz/purify) :1st_place_medal: :hourglass_flowing_sand: - A simple, fast & cool prompt.
* [purify (kyoz)](https://github.com/kyoz/purify) :1st_place_medal: :hourglass_flowing_sand: - A clean and vibrant theme, best on dark backgrounds. Includes `git` status decorations.
* [qoomon](https://github.com/qoomon/zsh-theme-qoomon) : :hourglass: - Optimized for dark backgrounds, includes `git` information. Theme repo includes iTerm 2 and Terminal color settings.
* [shelby](https://github.com/athul/shelby) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - Fast, lightweight and minimal prompt written in pure `golang`. Includes decorations for last command exit status, `git` status and the current working directory.
* [shellder](https://github.com/simnalamburt/shellder) :1st_place_medal: - Minimal theme with git branch display. Requires a Powerline-compatible font.
* [shini](https://github.com/bashelled/shini) : :hourglass_flowing_sand: - A tiny theme that just shouts out small. Includes directory, username, hostname, time and `git` decorations.
* [silver](https://github.com/reujab/silver) :1st_place_medal: :hourglass_flowing_sand: - A cross-shell customizable powerline-like prompt heavily inspired by [Agnoster](https://github.com/agnoster/agnoster-zsh-theme). A faster rust port of [bronze](https://github.com/reujab/bronze). Requires [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts). Very configurable, includes `git` status decorations.
* [skeletor-syntax](https://github.com/ramonmcros/skeletor-syntax) :1st_place_medal: - Theme collection for Atom, Prism and ZSH inspired by Skeletor from He-Man and the Masters of the Universe.
* [slick](https://github.com/nbari/slick) : - Inspired by the [pure](https://github.com/sindresorhus/pure), [purs](https://github.com/xcambar/purs) and [zsh-efgit-prompt](https://github.com/ericfreese/zsh-efgit-prompt). Requires `cargo` for installation.
* [slimline](https://github.com/mengelbrecht/slimline) :1st_place_medal: - Minimal, fast and elegant ZSH prompt. Displays the right information at the right time.
* [sm](https://github.com/blyndusk/sm-theme) :1st_place_medal: A **Simplist** & **Minimalist** theme for your **favorite** terminal. Includes `git` status decorations.
* [solarized-powerline (KuoE0)](https://github.com/KuoE0/oh-my-zsh-solarized-powerline-theme) : - Solarized powerline variant.
* [spaceship](https://github.com/denysdovhan/spaceship-prompt) :1st_place_medal: :alarm_clock: :running_man: :briefcase: :chart_with_upwards_trend: - Theme with `git`, `nvm`, rvm/rbenv/chruby, python, `ssh` and other useful status indicators.
* [spyrhoo](https://github.com/FajarKim/spyrhoo-zsh-theme) : :hourglass_flowing_sand: - Includes time, `git` and current directory decorations.
* [starship](https://github.com/starship/starship) :1st_place_medal: :alarm_clock: :running_man: :briefcase: :chart_with_upwards_trend: - Minimal, fast, extremely customizable.
* [statusline](https://github.com/el1t/statusline) : - A responsive ZSH theme that provides informational segments when you need them.
* [tvline](https://github.com/thvitt/tvline) :1st_place_medal: - Derived from the [agnoster](https://gist.github.com/agnoster/3712874) theme, adds powerline font enhancements.
* [typewritten](https://github.com/reobin/typewritten) :1st_place_medal: :walking_man: :hourglass_flowing_sand: - Minimal and informative theme that leaves room for what's important. Does asynchronous `git` decoration updates for speed.
* [wild-cherry](https://github.com/mashaal/wild-cherry) :1st_place_medal: :hourglass_flowing_sand: - A fairy-tale inspired theme for ZSH, iTerm 2, Sublime, Atom, & Mou.
* [wkentaro](https://github.com/wkentaro/wkentaro.zsh-theme) : :hourglass: - A simple theme for Python users. Includes virtualenv and `git` status decorators.
* [yazpt](https://github.com/jakshin/yazpt) :1st_place_medal: :running_man: :hourglass_flowing_sand: - A clean, fast, good-looking ZSH prompt theme that thoughtfully incorporates Git/Subversion/TFVC status info, integrates with popular plugin managers like Oh My Zsh, and is straightforward to customize and extend.
* [zero](https://github.com/arlimus/zero.zsh) :1st_place_medal: - Zero's theme & plugin. Has variants for both light and dark terminal backgrounds.
* [zinc](https://gitlab.com/robobenklein/zinc) :1st_place_medal: - A blazing-fast, pure ZSH, mixed asynchronous powerline prompt that's easily extensible and extremely configurable.
* [zshpower](https://github.com/snakypy/zshpower) :1st_place_medal: :alarm_clock: :running_man: - Optimized for python developers. Includes `git` and `pyenv` status decorations, username and host. Tries to install other plugins and fonts, so read its instructions before installing.
* [zwsh](https://github.com/naens/zwsh) :1st_place_medal: - A Zpm3/Wordstar mode/theme for ZSH.
