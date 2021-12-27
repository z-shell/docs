```zsh
zi wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
  z-shell/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
  blockf atpull'zi creinstall -q .' \
  zsh-users/zsh-completions
```

- `wait` – load 0 seconds (about 5 ms exactly) after prompt (**Turbo mode**),
- `lucid` – silence the under-prompt messages ("`Loaded {name of the plugin}`"),
- `light-mode` – load the plugin in `light` mode, in which the tracking of
  plugin (i.e. activity report gathering, accessible via the `zi report {plugin-spec}` subcommand) is being disabled; note that for Turbo mode, the
  performance gains are almost `0`, so in this mode, you can load all plugins
  with the tracking, i.e.: the `light-mode` ice can be removed from the
  command,
- `atpull''` – execute after updating the plugin – the command in the ice will
  install any new completions,
- `atinit''` – execute code before loading plugin,
- `atload''` – execute code after loading plugin,
- `zicompinit` – equals to `autoload compinit; compinit`,
- `zicdreplay` – execute `compdef …` calls that plugins did – they were
  recorded, so that `compinit` can be called later (`compinit` provides the
  `compdef` function, so it must be ran before issuing the taken-over
  `compdef`s with `zicdreplay`),
- syntax-highlighting plugins (like
  [**F-Sy-H**](https://github.com/z-shell/F-Sy-H)
  or
  [**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting))
  theoretically expect to be loaded last, even after the completion
  initialization (i.e. `compinit` function), however, in practice, you just
  have to ensure that such plugin is loaded after plugins that are issuing
  `compdef`s – which basically means completions that aren't using the
  underscore-starting function file; the completion initialization still has to
  be performed before syntax-highlighting plugin, hence the `atinit''` ice,
  which will load `compinit` right before loading the plugin,
- the syntax-highlighting and suggestions plugins are loaded early for a better
  user experience.

The same setup but without using Turbo mode (i.e. no `wait''` ice) and without[The `for''` syntax](Syntax#the-for-syntax):

```zsh
zi ice blockf atpull'zi creinstall -q .'
zi light zsh-users/zsh-completions

autoload compinit
compinit

zi light z-shell/F-Sy-H

zi light zsh-users/zsh-autosuggestions
```

Without Turbo the syntax-highlighting plugin can be loaded at the end, as it
doesn't make any difference (the prompt will appear after loading all objects,
anyway).
