
- `load''` – condition that when fulfilled will cause plugin to be loaded,
- `unload''` – as above, but will unload plugin, note that plugins are loaded with <code>zi load </code>, not `zi light`, to track what plugin does, to be able to unload it,
- `atload'!…'` – run the `precmd` hooks to make the prompts fully initialized when loaded in the middle of the prompt (`precmd` hooks are being normally run before each **new** prompt); exclamation mark causes the effects of the functions to be tracked, to allow better unloading,
- conditions are checked every second, you can use conditions like `![[ $PWD == *github* ]]` to change prompt after changing directory to `*github*`, the exclamation mark `![[ … ]]` causes prompt to be reset after loading or unloading the plugin,
- `pick'/dev/null'` – disable sourcing of the default-found file,
- `multisrc''` – source multiple files,
- `lucid` – don't show the under-prompt message that says e.g.: `Loaded geometry-zsh/geometry`,
- `nocd` – don't cd into the plugin's directory when executing the `atload''` ice – it could make the path that's displayed by the theme to point to that directory.

```zsh
# Theme no. 1 - zprompts
zi lucid \
 load'![[ $MYPROMPT = 1 ]]' \
 unload'![[ $MYPROMPT != 1 ]]' \
 atload'!promptinit; typeset -g PSSHORT=0; prompt sprint3 yellow red green blue' \
 nocd for \
    z-shell/zprompts

# Theme no. 2 – lambda-mod-zsh-theme
zi lucid load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]' nocd for \
    halfo/lambda-mod-zsh-theme

# Theme no. 3 – lambda-gitster
zi lucid load'![[ $MYPROMPT = 3 ]]' unload'![[ $MYPROMPT != 3 ]]' nocd for \
    ergenekonyigit/lambda-gitster

# Theme no. 4 – geometry
zi lucid load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' \
 atload'!geometry::prompt' nocd \
 atinit'GEOMETRY_COLOR_DIR=63 GEOMETRY_PATH_COLOR=63' for \
    geometry-zsh/geometry

# Theme no. 5 – pure
zi lucid load'![[ $MYPROMPT = 5 ]]' unload'![[ $MYPROMPT != 5 ]]' \
 pick"/dev/null" multisrc"{async,pure}.zsh" atload'!prompt_pure_precmd' nocd for \
    sindresorhus/pure

# Theme no. 6 - agkozak-zsh-theme
zi lucid load'![[ $MYPROMPT = 6 ]]' unload'![[ $MYPROMPT != 6 ]]' \
 atload'!_agkozak_precmd' nocd atinit'AGKOZAK_FORCE_ASYNC_METHOD=subst-async' for \
    agkozak/agkozak-zsh-theme

# Theme no. 7 - zinc
zi load'![[ $MYPROMPT = 7 ]]' unload'![[ $MYPROMPT != 7 ]]' \
 compile"{zinc_functions/*,segments/*,zinc.zsh}" nocompletions \
 atload'!prompt_zinc_setup; prompt_zinc_precmd' nocd for \
    robobenklein/zinc

# Theme no. 8 - git-prompt
zi lucid load'![[ $MYPROMPT = 8 ]]' unload'![[ $MYPROMPT != 8 ]]' \
 atload'!_zsh_git_prompt_precmd_hook' nocd for \
    woefe/git-prompt.zsh
```
