code/zsdoc
├── Makefile
├── ZSDOC_REAMDE.md
├── asciidoc
│   ├── additional.zsh.adoc
│   ├── autoload.zsh.adoc
│   ├── install.zsh.adoc
│   ├── side.zsh.adoc
│   └── zi.zsh.adoc
├── data
│   ├── autoload
│   │   ├── install.zsh
│   │   │   └── compinit
│   │   ├── side.zsh
│   │   │   └── zmv
│   │   └── zi.zsh
│   │       ├── add-zsh-hook
│   │       ├── compinit
│   │       └── is-at-least
│   ├── bodies
│   │   ├── additional.zsh
│   │   ├── additional.zsh.comments
│   │   ├── autoload.zsh
│   │   ├── autoload.zsh.comments
│   │   ├── install.zsh
│   │   ├── install.zsh.comments
│   │   ├── side.zsh
│   │   ├── side.zsh.comments
│   │   ├── zi.zsh
│   │   └── zi.zsh.comments
│   ├── call_tree.zsd
│   ├── descriptions
│   │   ├── additional.zsh
│   │   │   └── :zi-tmp-subst-source
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   │   ├── compinit
│   │   │   ├── zicp
│   │   │   ├── ziextract
│   │   │   ├── zimv
│   │   │   ├── zpextract
│   │   │   ├── ∞zi-atclone-hook
│   │   │   ├── ∞zi-atpull-e-hook
│   │   │   ├── ∞zi-atpull-hook
│   │   │   ├── ∞zi-compile-plugin-hook
│   │   │   ├── ∞zi-cp-hook
│   │   │   ├── ∞zi-extract-hook
│   │   │   ├── ∞zi-make-e-hook
│   │   │   ├── ∞zi-make-ee-hook
│   │   │   ├── ∞zi-make-hook
│   │   │   ├── ∞zi-mv-hook
│   │   │   ├── ∞zi-ps-on-update-hook
│   │   │   └── ∞zi-reset-hook
│   │   ├── side.zsh
│   │   │   └── zmv
│   │   └── zi.zsh
│   │       ├── +zi-deploy-message
│   │       ├── +zi-message
│   │       ├── +zi-prehelp-usage-message
│   │       ├── -zi_scheduler_add_sh
│   │       ├── :zi-reload-and-run
│   │       ├── :zi-tmp-subst-alias
│   │       ├── :zi-tmp-subst-autoload
│   │       ├── :zi-tmp-subst-bindkey
│   │       ├── :zi-tmp-subst-compdef
│   │       ├── :zi-tmp-subst-zle
│   │       ├── :zi-tmp-subst-zstyle
│   │       ├── @autoload
│   │       ├── @zi-register-annex
│   │       ├── @zi-register-hook
│   │       ├── @zi-scheduler
│   │       ├── @zi-substitute
│   │       ├── @zsh-plugin-run-on-unload
│   │       ├── @zsh-plugin-run-on-update
│   │       ├── add-zsh-hook
│   │       ├── compinit
│   │       ├── is-at-least
│   │       ├── pmodload
│   │       ├── zi
│   │       ├── zi-turbo
│   │       ├── zicdclear
│   │       ├── zicdreplay
│   │       ├── zicompdef
│   │       ├── zicompinit
│   │       └── zpcdreplay
│   ├── env-use
│   │   ├── additional.zsh
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   │   └── zicp
│   │   │       └── zi.zsh
│   │   │           └── Script_Body_
│   │   │               └── ZPFX
│   │   ├── side.zsh
│   │   └── zi.zsh
│   │       ├── @zi-substitute
│   │       │   └── zi.zsh
│   │       │       └── Script_Body_
│   │       │           └── ZPFX
│   │       └── zsd_script_body
│   │           └── zi.zsh
│   │               └── Script_Body_
│   │                   ├── ZPFX
│   │                   └── ZSH_CACHE_DIR
│   ├── exports
│   │   ├── additional.zsh
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   ├── side.zsh
│   │   └── zi.zsh
│   │       └── Script_Body_
│   │           ├── PMSPEC
│   │           ├── ZPFX
│   │           └── ZSH_CACHE_DIR
│   ├── extended
│   │   ├── additional.zsh
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   ├── side.zsh
│   │   └── zi.zsh
│   ├── features
│   │   ├── additional.zsh
│   │   │   └── :zi-tmp-subst-source
│   │   │       └── eval
│   │   ├── autoload.zsh
│   │   │   └── Script_Body_
│   │   │       └── source
│   │   ├── install.zsh
│   │   │   ├── Script_Body_
│   │   │   │   └── source
│   │   │   ├── compinit
│   │   │   │   ├── autoload
│   │   │   │   ├── bindkey
│   │   │   │   ├── compdef
│   │   │   │   ├── compdump
│   │   │   │   ├── eval
│   │   │   │   ├── read
│   │   │   │   ├── setopt
│   │   │   │   ├── unfunction
│   │   │   │   ├── zle
│   │   │   │   └── zstyle
│   │   │   ├── zicp
│   │   │   │   └── setopt
│   │   │   ├── ziextract
│   │   │   │   ├── setopt
│   │   │   │   ├── unfunction
│   │   │   │   └── zparseopts
│   │   │   ├── ∞zi-atclone-hook
│   │   │   │   ├── eval
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-atpull-e-hook
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-atpull-hook
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-compile-plugin-hook
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-cp-hook
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-mv-hook
│   │   │   │   └── setopt
│   │   │   ├── ∞zi-ps-on-update-hook
│   │   │   │   └── eval
│   │   │   └── ∞zi-reset-hook
│   │   │       └── eval
│   │   ├── side.zsh
│   │   │   └── zmv
│   │   │       ├── eval
│   │   │       ├── getopts
│   │   │       ├── read
│   │   │       └── setopt
│   │   └── zi.zsh
│   │       ├── +zi-deploy-message
│   │       │   ├── read
│   │       │   └── zle
│   │       ├── :zi-reload-and-run
│   │       │   ├── autoload
│   │       │   └── unfunction
│   │       ├── :zi-tmp-subst-alias
│   │       │   ├── alias
│   │       │   ├── setopt
│   │       │   └── zparseopts
│   │       ├── :zi-tmp-subst-autoload
│   │       │   ├── autoload
│   │       │   ├── eval
│   │       │   ├── is-at-least
│   │       │   ├── setopt
│   │       │   └── zparseopts
│   │       ├── :zi-tmp-subst-bindkey
│   │       │   ├── bindkey
│   │       │   ├── is-at-least
│   │       │   ├── setopt
│   │       │   └── zparseopts
│   │       ├── :zi-tmp-subst-compdef
│   │       │   └── setopt
│   │       ├── :zi-tmp-subst-zle
│   │       │   ├── setopt
│   │       │   └── zle
│   │       ├── :zi-tmp-subst-zstyle
│   │       │   ├── setopt
│   │       │   ├── zparseopts
│   │       │   └── zstyle
│   │       ├── @zi-scheduler
│   │       │   ├── add-zsh-hook
│   │       │   ├── sched
│   │       │   ├── setopt
│   │       │   └── zle
│   │       ├── @zi-substitute
│   │       │   └── setopt
│   │       ├── Script_Body_
│   │       │   ├── add-zsh-hook
│   │       │   ├── alias
│   │       │   ├── autoload
│   │       │   ├── export
│   │       │   ├── is-at-least
│   │       │   ├── setopt
│   │       │   ├── source
│   │       │   ├── zmodload
│   │       │   └── zstyle
│   │       ├── add-zsh-hook
│   │       │   ├── autoload
│   │       │   └── getopts
│   │       ├── compinit
│   │       │   ├── autoload
│   │       │   ├── bindkey
│   │       │   ├── compdef
│   │       │   ├── compdump
│   │       │   ├── eval
│   │       │   ├── read
│   │       │   ├── setopt
│   │       │   ├── unfunction
│   │       │   ├── zle
│   │       │   └── zstyle
│   │       ├── pmodload
│   │       │   └── zstyle
│   │       ├── zi
│   │       │   ├── autoload
│   │       │   ├── compinit
│   │       │   ├── eval
│   │       │   ├── setopt
│   │       │   └── source
│   │       ├── zicompinit
│   │       │   ├── autoload
│   │       │   └── compinit
│   │       └── zpcompinit
│   │           ├── autoload
│   │           └── compinit
│   ├── functions
│   │   ├── additional.zsh
│   │   │   └── :zi-tmp-subst-source
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   │   ├── zicp
│   │   │   ├── ziextract
│   │   │   ├── zimv
│   │   │   ├── zpextract
│   │   │   ├── ∞zi-atclone-hook
│   │   │   ├── ∞zi-atpull-e-hook
│   │   │   ├── ∞zi-atpull-hook
│   │   │   ├── ∞zi-compile-plugin-hook
│   │   │   ├── ∞zi-cp-hook
│   │   │   ├── ∞zi-extract-hook
│   │   │   ├── ∞zi-make-e-hook
│   │   │   ├── ∞zi-make-ee-hook
│   │   │   ├── ∞zi-make-hook
│   │   │   ├── ∞zi-mv-hook
│   │   │   ├── ∞zi-ps-on-update-hook
│   │   │   └── ∞zi-reset-hook
│   │   ├── side.zsh
│   │   └── zi.zsh
│   │       ├── +zi-deploy-message
│   │       ├── +zi-message
│   │       ├── +zi-prehelp-usage-message
│   │       ├── -zi_scheduler_add_sh
│   │       ├── :zi-reload-and-run
│   │       ├── :zi-tmp-subst-alias
│   │       ├── :zi-tmp-subst-autoload
│   │       ├── :zi-tmp-subst-bindkey
│   │       ├── :zi-tmp-subst-compdef
│   │       ├── :zi-tmp-subst-zle
│   │       ├── :zi-tmp-subst-zstyle
│   │       ├── @autoload
│   │       ├── @zi-register-annex
│   │       ├── @zi-register-hook
│   │       ├── @zi-scheduler
│   │       ├── @zi-substitute
│   │       ├── @zsh-plugin-run-on-unload
│   │       ├── @zsh-plugin-run-on-update
│   │       ├── pmodload
│   │       ├── zi
│   │       ├── zi-turbo
│   │       ├── zicdclear
│   │       ├── zicdreplay
│   │       ├── zicompdef
│   │       ├── zicompinit
│   │       ├── zpcdclear
│   │       ├── zpcdreplay
│   │       ├── zpcompdef
│   │       └── zpcompinit
│   ├── hooks
│   │   ├── additional.zsh
│   │   ├── autoload.zsh
│   │   ├── install.zsh
│   │   ├── side.zsh
│   │   └── zi.zsh
│   │       └── @zi-scheduler
│   ├── rev_call_tree.zsd
│   └── trees
│       ├── additional.zsh
│       │   ├── :zi-tmp-subst-source
│       │   │   └── zi.zsh_-_+zi-message
│       │   └── :zi-tmp-subst-source.tree
│       ├── autoload.zsh
│       ├── install.zsh
│       │   ├── ziextract
│       │   │   └── zi.zsh_-_+zi-message
│       │   ├── ziextract.tree
│       │   ├── zimv
│       │   │   └── zicp
│       │   ├── zimv.tree
│       │   ├── zpextract
│       │   │   └── ziextract
│       │   │       └── zi.zsh_-_+zi-message
│       │   ├── zpextract.tree
│       │   ├── ∞zi-atclone-hook
│       │   │   ├── side.zsh_-_.zi-countdown
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-atclone-hook.tree
│       │   ├── ∞zi-atpull-e-hook
│       │   │   └── side.zsh_-_.zi-countdown
│       │   ├── ∞zi-atpull-e-hook.tree
│       │   ├── ∞zi-atpull-hook
│       │   │   └── side.zsh_-_.zi-countdown
│       │   ├── ∞zi-atpull-hook.tree
│       │   ├── ∞zi-compile-plugin-hook
│       │   ├── ∞zi-compile-plugin-hook.tree
│       │   ├── ∞zi-cp-hook
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-cp-hook.tree
│       │   ├── ∞zi-extract-hook
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-extract-hook.tree
│       │   ├── ∞zi-make-e-hook
│       │   │   ├── side.zsh_-_.zi-countdown
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-make-e-hook.tree
│       │   ├── ∞zi-make-ee-hook
│       │   │   ├── side.zsh_-_.zi-countdown
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-make-ee-hook.tree
│       │   ├── ∞zi-make-hook
│       │   │   ├── side.zsh_-_.zi-countdown
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-make-hook.tree
│       │   ├── ∞zi-mv-hook
│       │   │   └── zi.zsh_-_@zi-substitute
│       │   ├── ∞zi-mv-hook.tree
│       │   ├── ∞zi-ps-on-update-hook
│       │   │   └── zi.zsh_-_+zi-message
│       │   ├── ∞zi-ps-on-update-hook.tree
│       │   ├── ∞zi-reset-hook
│       │   │   └── zi.zsh_-_+zi-message
│       │   └── ∞zi-reset-hook.tree
│       ├── side.zsh
│       └── zi.zsh
│           ├── +zi-prehelp-usage-message
│           │   └── +zi-message
│           ├── +zi-prehelp-usage-message.tree
│           ├── :zi-tmp-subst-alias
│           ├── :zi-tmp-subst-alias.tree
│           ├── :zi-tmp-subst-autoload
│           │   ├── +zi-message
│           │   └── is-at-least
│           ├── :zi-tmp-subst-autoload.tree
│           ├── :zi-tmp-subst-bindkey
│           │   └── is-at-least
│           ├── :zi-tmp-subst-bindkey.tree
│           ├── :zi-tmp-subst-compdef
│           ├── :zi-tmp-subst-compdef.tree
│           ├── :zi-tmp-subst-zle
│           ├── :zi-tmp-subst-zle.tree
│           ├── :zi-tmp-subst-zstyle
│           ├── :zi-tmp-subst-zstyle.tree
│           ├── @autoload
│           │   └── :zi-tmp-subst-autoload
│           │       ├── +zi-message
│           │       └── is-at-least
│           ├── @autoload.tree
│           ├── @zi-scheduler
│           │   └── add-zsh-hook
│           ├── @zi-scheduler.tree
│           ├── @zsh-plugin-run-on-unload
│           ├── @zsh-plugin-run-on-unload.tree
│           ├── @zsh-plugin-run-on-update
│           ├── @zsh-plugin-run-on-update.tree
│           ├── Script_Body_
│           │   ├── +zi-message
│           │   ├── @zi-register-hook
│           │   ├── add-zsh-hook
│           │   ├── autoload.zsh_-_.zi-module
│           │   └── is-at-least
│           ├── Script_Body_.tree
│           ├── pmodload
│           ├── pmodload.tree
│           ├── zi
│           │   ├── +zi-message
│           │   ├── +zi-prehelp-usage-message
│           │   │   └── +zi-message
│           │   ├── additional.zsh_-_.zi-clear-debug-report
│           │   ├── additional.zsh_-_.zi-debug-start
│           │   ├── additional.zsh_-_.zi-debug-stop
│           │   ├── additional.zsh_-_.zi-debug-unload
│           │   ├── autoload.zsh_-_.zi-analytics-menu
│           │   ├── autoload.zsh_-_.zi-cdisable
│           │   ├── autoload.zsh_-_.zi-cenable
│           │   ├── autoload.zsh_-_.zi-clear-completions
│           │   ├── autoload.zsh_-_.zi-compile-uncompile-all
│           │   ├── autoload.zsh_-_.zi-compiled
│           │   ├── autoload.zsh_-_.zi-control-menu
│           │   ├── autoload.zsh_-_.zi-help
│           │   ├── autoload.zsh_-_.zi-list-bindkeys
│           │   ├── autoload.zsh_-_.zi-list-compdef-replay
│           │   ├── autoload.zsh_-_.zi-ls
│           │   ├── autoload.zsh_-_.zi-module
│           │   ├── autoload.zsh_-_.zi-recently
│           │   ├── autoload.zsh_-_.zi-search-completions
│           │   ├── autoload.zsh_-_.zi-self-update
│           │   ├── autoload.zsh_-_.zi-show-all-reports
│           │   ├── autoload.zsh_-_.zi-show-completions
│           │   ├── autoload.zsh_-_.zi-show-debug-report
│           │   ├── autoload.zsh_-_.zi-show-registered-plugins
│           │   ├── autoload.zsh_-_.zi-show-report
│           │   ├── autoload.zsh_-_.zi-show-times
│           │   ├── autoload.zsh_-_.zi-show-zstatus
│           │   ├── autoload.zsh_-_.zi-uncompile-plugin
│           │   ├── autoload.zsh_-_.zi-uninstall-completions
│           │   ├── autoload.zsh_-_.zi-unload
│           │   ├── autoload.zsh_-_.zi-update-or-status
│           │   ├── autoload.zsh_-_.zi-update-or-status-all
│           │   ├── compinit
│           │   ├── install.zsh_-_.zi-compile-plugin
│           │   ├── install.zsh_-_.zi-compinit
│           │   ├── install.zsh_-_.zi-forget-completion
│           │   └── install.zsh_-_.zi-install-completions
│           ├── zi-turbo
│           │   └── zi
│           │       ├── +zi-message
│           │       ├── +zi-prehelp-usage-message
│           │       │   └── +zi-message
│           │       ├── additional.zsh_-_.zi-clear-debug-report
│           │       ├── additional.zsh_-_.zi-debug-start
│           │       ├── additional.zsh_-_.zi-debug-stop
│           │       ├── additional.zsh_-_.zi-debug-unload
│           │       ├── autoload.zsh_-_.zi-analytics-menu
│           │       ├── autoload.zsh_-_.zi-cdisable
│           │       ├── autoload.zsh_-_.zi-cenable
│           │       ├── autoload.zsh_-_.zi-clear-completions
│           │       ├── autoload.zsh_-_.zi-compile-uncompile-all
│           │       ├── autoload.zsh_-_.zi-compiled
│           │       ├── autoload.zsh_-_.zi-control-menu
│           │       ├── autoload.zsh_-_.zi-help
│           │       ├── autoload.zsh_-_.zi-list-bindkeys
│           │       ├── autoload.zsh_-_.zi-list-compdef-replay
│           │       ├── autoload.zsh_-_.zi-ls
│           │       ├── autoload.zsh_-_.zi-module
│           │       ├── autoload.zsh_-_.zi-recently
│           │       ├── autoload.zsh_-_.zi-search-completions
│           │       ├── autoload.zsh_-_.zi-self-update
│           │       ├── autoload.zsh_-_.zi-show-all-reports
│           │       ├── autoload.zsh_-_.zi-show-completions
│           │       ├── autoload.zsh_-_.zi-show-debug-report
│           │       ├── autoload.zsh_-_.zi-show-registered-plugins
│           │       ├── autoload.zsh_-_.zi-show-report
│           │       ├── autoload.zsh_-_.zi-show-times
│           │       ├── autoload.zsh_-_.zi-show-zstatus
│           │       ├── autoload.zsh_-_.zi-uncompile-plugin
│           │       ├── autoload.zsh_-_.zi-uninstall-completions
│           │       ├── autoload.zsh_-_.zi-unload
│           │       ├── autoload.zsh_-_.zi-update-or-status
│           │       ├── autoload.zsh_-_.zi-update-or-status-all
│           │       ├── compinit
│           │       ├── install.zsh_-_.zi-compile-plugin
│           │       ├── install.zsh_-_.zi-compinit
│           │       ├── install.zsh_-_.zi-forget-completion
│           │       └── install.zsh_-_.zi-install-completions
│           ├── zi-turbo.tree
│           ├── zi.tree
│           ├── zicdclear
│           ├── zicdclear.tree
│           ├── zicdreplay
│           ├── zicdreplay.tree
│           ├── zicompinit
│           │   └── compinit
│           ├── zicompinit.tree
│           ├── zpcdclear
│           ├── zpcdclear.tree
│           ├── zpcdreplay
│           ├── zpcdreplay.tree
│           ├── zpcompinit
│           │   └── compinit
│           └── zpcompinit.tree
├── html
│   ├── additional.zsh.html
│   ├── autoload.zsh.html
│   ├── install.zsh.html
│   ├── side.zsh.html
│   └── zi.zsh.html
└── pdf
    ├── additional.zsh.pdf
    ├── autoload.zsh.pdf
    ├── install.zsh.pdf
    ├── side.zsh.pdf
    └── zi.zsh.pdf

245 directories, 266 files
wiki/zsh
├── Makefile
├── Zsh-Native-Scripting-Handbook.adoc
├── Zsh-Native-Scripting-Handbook.pdf
├── Zsh-Plugin-Standard.adoc
└── Zsh-Plugin-Standard.pdf

0 directories, 5 files
wiki/zi
├── 01-introduction
│   ├── Hints-&-Tips.md
│   ├── Introduction.md
│   └── Usage.md
├── 02-commands
│   ├── Code-Documentation.md
│   ├── Commands.md
│   └── How-to-Use.md
├── 03-syntax
│   ├── Syntax.md
│   └── ice-syntax
│       ├── Alternate-Ice-Syntax.md
│       ├── Ice-modifiers.md
│       └── Ices.md
├── 05-gallery
│   ├── Compiling-programs.md
│   ├── Gallery.md
│   ├── Minimal-Setup.md
│   ├── Multiple-prompts.md
│   ├── Oh-My-Zsh-Setup.md
│   ├── Profiling-plugins.md
│   └── Specific-Setup.md
├── 06-knowledge-base
│   ├── Zsh-Native-Scripting-Handbook.asciidoc
│   └── Zsh-Plugin-Standard.asciidoc
├── Home.md
├── _Footer.md
├── _Sidebar.md
├── annexes
│   ├── Annexes.md
│   ├── z-a-bin-gem-node.md
│   ├── z-a-eval.md
│   ├── z-a-linkbin.md
│   ├── z-a-man.md
│   ├── z-a-meta-plugins.md
│   ├── z-a-patch-dl.md
│   ├── z-a-rust.md
│   ├── z-a-submods.md
│   └── z-a-test.md
├── modules
│   └── Zsh-module-zpmod.md
├── packages
│   └── Packages.md
└── plugins
    ├── crasis.md
    └── declare-zsh.md

10 directories, 36 files
