

typeset -gaH ZI_REGISTERED_PLUGINS ZI_TASKS ZI_RUN
typeset -ga zsh_loaded_plugins
if (( !${#ZI_TASKS} )) { ZI_TASKS=( "<no-data>" ); }
typeset -gAH ZI ZI_SNIPPETS ZI_REPORTS ZI_ICES ZI_SICE ZI_CUR_BIND_MAP ZI_EXTS ZI_EXTS2
typeset -gaH ZI_COMPDEF_REPLAY
typeset -gAH ZINIT
ZI=( "${(kv)ZINIT[@]}" "${(kv)ZI[@]}" )
unset ZINIT
ZI[ice-list]="svn|proto|from|teleid|bindmap|cloneopts|id-as|depth|if|wait|load|unload|blockf|pick|bpick|src|as|ver|silent|lucid|notify|mv|cp|atinit|atclone|atload|atpull|nocd|run-atpull|has|cloneonly|make|service|trackbinds|multisrc|compile|nocompile|nocompletions|reset-prompt|wrap|reset|sh|\!sh|bash|\!bash|ksh|\!ksh|csh|\!csh|aliases|countdown|ps-on-unload|ps-on-update|trigger-load|light-mode|is-snippet|atdelete|pack|git|verbose|on-update-of|subscribe|extract|param|opts|autoload|subst|install|pullopts|debug|null|binary"|binary"
ZI[nval-ice-list]="blockf|silent|lucid|trackbinds|cloneonly|nocd|run-atpull|nocompletions|sh|\!sh|bash|\!bash|ksh|\!ksh|csh|\!csh|aliases|countdown|light-mode|is-snippet|git|verbose|cloneopts|pullopts|debug|null|binary|make|nocompile|notify|reset"
[[ ! -e ${ZI[BIN_DIR]}/zi.zsh ]] && ZI[BIN_DIR]=
ZI[ZERO]="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
[[ ! -o functionargzero || ${options[posixargzero]} = on || ${ZI[ZERO]} != */* ]] && ZI[ZERO]="${(%):-%N}"
: ${ZI[BIN_DIR]:="${ZI[ZERO]:h}"}
[[ ${ZI[BIN_DIR]} = \~* ]] && ZI[BIN_DIR]=${~ZI[BIN_DIR]}
ZI[BIN_DIR]="${${(M)ZI[BIN_DIR]:#/*}:-$PWD/${ZI[BIN_DIR]}}"
if [[ ! -e ${ZI[BIN_DIR]}/zi.zsh ]]; then
  builtin print -P "%F{196}Could not establish ZI[BIN_DIR] hash field. It should point where ❮ ZI ❯ Git repository is.%f"
  return 1
fi
if [[ -z ${ZI[HOME_DIR]} ]]; then
  if [[ -d ${HOME}/.zi ]]; then
  ZI[HOME_DIR]="${HOME}/.zi"
  elif [[ -d ${ZDOTDIR:-$HOME}/.zi ]]; then
  ZI[HOME_DIR]="${ZDOTDIR:-$HOME}/.zi"
  elif [[ -d ${XDG_DATA_HOME:-$HOME}/.zi ]]; then
  ZI[HOME_DIR]="${XDG_DATA_HOME:-$HOME}/.zi"
  else
  ZI[HOME_DIR]="${HOME}/.zi"
  fi
fi
if [[ ! -d ${ZI[HOME_DIR]} ]]; then
  builtin print -P "%F{196}Could not establish ZI[HOME_DIR] location. It should point to the default home location of ❮ ZI ❯%f"
  return 1
fi
: ${ZI[PLUGINS_DIR]:=${ZI[HOME_DIR]}/plugins}
: ${ZI[SNIPPETS_DIR]:=${ZI[HOME_DIR]}/snippets}
: ${ZI[SERVICES_DIR]:=${ZI[HOME_DIR]}/services}
: ${ZI[ZMODULES_DIR]:=${ZI[HOME_DIR]}/zmodules}
: ${ZI[COMPLETIONS_DIR]:=${ZI[HOME_DIR]}/completions}
typeset -g ZPFX
: ${ZPFX:=${ZI[HOME_DIR]}/polaris}
: ${ZI[MAN_DIR]:=${ZPFX}/man}
: ${ZI[ALIASES_OPT]::=${${options[aliases]:#off}:+1}}

ZI[PLUGINS_DIR]=${~ZI[PLUGINS_DIR]}   ZI[COMPLETIONS_DIR]=${~ZI[COMPLETIONS_DIR]} ZI[SNIPPETS_DIR]=${~ZI[SNIPPETS_DIR]}
ZI[SERVICES_DIR]=${~ZI[SERVICES_DIR]} ZI[ZMODULES_DIR]=${~ZI[ZMODULES_DIR]}

export ZPFX=${~ZPFX} ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zi}" PMSPEC=0fuUpiPs
[[ -z ${path[(re)$ZPFX/bin]} ]] && [[ -d "$ZPFX/bin" ]] && path=( "$ZPFX/bin" "${path[@]}" )
[[ -z ${path[(re)$ZPFX/sbin]} ]] && [[ -d "$ZPFX/sbin" ]] && path=( "$ZPFX/sbin" "${path[@]}" )
[[ -z ${fpath[(re)${ZI[COMPLETIONS_DIR]}]} ]] && fpath=( "${ZI[COMPLETIONS_DIR]}" "${fpath[@]}" )
[[ ! -d $ZSH_CACHE_DIR ]] && command mkdir -p "$ZSH_CACHE_DIR"
[[ -n ${ZI[ZCOMPDUMP_PATH]} ]] && ZI[ZCOMPDUMP_PATH]=${~ZI[ZCOMPDUMP_PATH]}
[[ ! -d ${~ZI[MAN_DIR]} ]] && command mkdir -p ${~ZI[MAN_DIR]}/man{1..9}

ZI[UPAR]=";:^[[A;:^[OA;:\\e[A;:\\eOA;:${termcap[ku]/$'\e'/^\[};:${terminfo[kcuu1]/$'\e'/^\[};:"
ZI[DOWNAR]=";:^[[B;:^[OB;:\\e[B;:\\eOB;:${termcap[kd]/$'\e'/^\[};:${terminfo[kcud1]/$'\e'/^\[};:"
ZI[RIGHTAR]=";:^[[C;:^[OC;:\\e[C;:\\eOC;:${termcap[kr]/$'\e'/^\[};:${terminfo[kcuf1]/$'\e'/^\[};:"
ZI[LEFTAR]=";:^[[D;:^[OD;:\\e[D;:\\eOD;:${termcap[kl]/$'\e'/^\[};:${terminfo[kcub1]/$'\e'/^\[};:"

builtin autoload -Uz is-at-least
is-at-least 5.1 && ZI[NEW_AUTOLOAD]=1 || ZI[NEW_AUTOLOAD]=0
ZI[TMP_SUBST]=inactive   ZI[DTRACE]=0    ZI[CUR_PLUGIN]=
declare -gA ZI_1MAP ZI_2MAP
ZI_1MAP=(
  OMZ:: https://github.com/ohmyzsh/ohmyzsh/trunk/
  OMZP:: https://github.com/ohmyzsh/ohmyzsh/trunk/plugins/
  OMZT:: https://github.com/ohmyzsh/ohmyzsh/trunk/themes/
  OMZL:: https://github.com/ohmyzsh/ohmyzsh/trunk/lib/
  PZT:: https://github.com/sorin-ionescu/prezto/trunk/
  PZTM:: https://github.com/sorin-ionescu/prezto/trunk/modules/
)
ZI_2MAP=(
  OMZ:: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/
  OMZP:: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/
  OMZT:: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/themes/
  OMZL:: https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/
  PZT:: https://raw.githubusercontent.com/sorin-ionescu/prezto/master/
  PZTM:: https://raw.githubusercontent.com/sorin-ionescu/prezto/master/modules/
)
zmodload zsh/zutil || { builtin print -P "%F{196}zsh/zutil module is required, aborting ❮ ZI ❯ set up.%f"; return 1; }
zmodload zsh/parameter || { builtin print -P "%F{196}zsh/parameter module is required, aborting ❮ ZI ❯ set up.%f"; return 1; }
zmodload zsh/terminfo 2>/dev/null
zmodload zsh/termcap 2>/dev/null
if [[ -z $SOURCED && ( ${+terminfo} -eq 1 && -n ${terminfo[colors]} ) || ( ${+termcap} -eq 1 && -n ${termcap[Co]} ) ]] {
  ZI+=(
  col-annex   $'\e[38;5;165m'      col-info    $'\e[38;5;82m'       col-p       $'\e[38;5;81m'
  col-apo     $'\e[1;38;5;220m'    col-info2   $'\e[38;5;220m'      col-pname   $'\e[1;4m\e[32m'
  col-b       $'\e[1m'             col-info3   $'\e[1m\e[38;5;220m' col-pre     $'\e[38;5;93m'
  col-bar     $'\e[38;5;82m'       col-it      $'\e[3m'             col-profile $'\e[38;5;201m'
  col-bspc    $'\b'                col-keyword $'\e[32m'            col-rst     $'\e[0m'
  col-b-lhi   $'\e[1m\e[38;5;27m'  col-lhi     $'\e[38;5;33m'       col-slight  $'\e[38;5;230m'
  col-b-warn  $'\e[1;38;5;214m'    col-msg     $'\e[0m'             col-st      $'\e[9m'
  col-cmd     $'\e[38;5;82m'       col-msg2    $'\e[38;5;172m'      col-tab     $' \t '
  col-data    $'\e[38;5;82m'       col-msg3    $'\e[38;5;238m'      col-term    $'\e[38;5;190m'
  col-data2   $'\e[38;5;39m'       col-meta    $'\e[38;5;57m'       col-th-bar  $'\e[38;5;82m'
  col-dir     $'\e[3;38;5;135m'    col-meta2   $'\e[38;5;135m'      col-txt     $'\e[38;5;254m'
  col-ehi     $'\e[1m\e[38;5;210m' col-nb      $'\e[22m'            col-u       $'\e[4m'
  col-error   $'\e[1m\e[38;5;204m' col-nit     $'\e[23m'            col-uname   $'\e[1;4m\e[35m'
  col-failure $'\e[38;5;204m'      col-nl      $'\n'                col-uninst  $'\e[38;5;118m'
  col-faint   $'\e[38;5;238m'      col-note    $'\e[38;5;148m'      col-url     $'\e[38;5;33m'
  col-file    $'\e[3;38;5;39m'     col-nst     $'\e[29m'            col-u-warn  $'\e[4;38;5;214m'
  col-func    $'\e[38;5;135m'      col-nu      $'\e[24m'            col-var     $'\e[38;5;39m'
  col-glob    $'\e[38;5;226m'      col-num     $'\e[3;38;5;154m'    col-version $'\e[3;38;5;46m'
  col-happy   $'\e[1m\e[38;5;82m'  col-obj     $'\e[38;5;218m'      col-warn    $'\e[38;5;214m'
  col-hi      $'\e[1m\e[38;5;165m' col-obj2    $'\e[38;5;118m'      col-dbg     $'\e[90m'
  col-ice     $'\e[38;5;39m'       col-ok      $'\e[38;5;220m'
  col-id-as   $'\e[4;38;5;220m'    col-opt     $'\e[38;5;82m'
  col-mdsh  "$'\e[1;38;5;220m'"${${${(M)LANG:#*UTF-8*}:+–}:--}"$'\e[0m'"
  col-mmdsh "$'\e[1;38;5;220m'"${${${(M)LANG:#*UTF-8*}:+――}:--}"$'\e[0m'"
  col-…     "${${${(M)LANG:#*UTF-8*}:+…}:-...}"  col-ndsh  "${${${(M)LANG:#*UTF-8*}:+–}:-}"
  col--…    "${${${(M)LANG:#*UTF-8*}:+⋯⋯}:-···}" col-lr    "${${${(M)LANG:#*UTF-8*}:+↔}:-"«-»"}"
  col-↔     "${${${(M)LANG:#*UTF-8*}:+$'\e[38;5;82m↔\e[0m'}:-$'\e[38;5;82m«-»\e[0m'}"
  )
  if [[ ( ${+terminfo} -eq 1 && ${terminfo[colors]} -ge 256 ) || ( ${+termcap} -eq 1 && ${termcap[Co]} -ge 256 ) ]] {
    ZI+=( col-pname $'\e[1;4m\e[38;5;39m' col-uname  $'\e[1;4m\e[38;5;207m' )
  }
}
typeset -gAH ZI_ZLE_HOOKS_LIST
ZI_ZLE_HOOKS_LIST=(
  zle-isearch-exit 1
  zle-isearch-update 1
  zle-line-pre-redraw 1
  zle-line-init 1
  zle-line-finish 1
  zle-history-line-set 1
  zle-keymap-select 1
  paste-insert 1
)

builtin setopt noaliases
(( ${+functions[pmodload]} )) ||

(( ZI[ALIASES_OPT] )) && builtin setopt aliases
(( ZI[SOURCED] ++ )) && return

autoload add-zsh-hook
if { zmodload zsh/datetime } {
  add-zsh-hook -- precmd @zi-scheduler
  ZI[HAVE_SCHEDULER]=1
}
functions -M -- zi_scheduler_add 1 1 -zi_scheduler_add_sh 2>/dev/null
zmodload zsh/zpty zsh/system 2>/dev/null
zmodload -F zsh/stat b:zstat 2>/dev/null && ZI[HAVE_ZSTAT]=1
builtin alias zpl=zi zplg=zi zini=zi zinit=zi

.zi-prepare-home
typeset -g ZI_TMP
.zi-get-mtime-into "${ZI[BIN_DIR]}/zi.zsh" "ZI[mtime]"
for ZI_TMP ( side install autoload ) {
  .zi-get-mtime-into "${ZI[BIN_DIR]}/lib/zsh/${ZI_TMP}.zsh" "ZI[mtime-${ZI_TMP}]"
}
ZI_REGISTERED_PLUGINS=( _local/zi "${(u)ZI_REGISTERED_PLUGINS[@]:#_local/zi}" )
ZI[STATES___local/zi]=1
zstyle ':prezto:module:completion' loaded 1
zstyle ':completion:*:zi:argument-rest:plugins' list-colors '=(#b)(*)/(*)==1;34=1;33'
zstyle ':completion:*:zi:argument-rest:plugins' matcher 'r:|=** l:|=*'
zstyle ':completion:*:*:zi:*' group-name ""
if [[ -e "${${ZI[ZMODULES_DIR]}}/zpmod/Src/zi/zpmod.so" ]] {
  if [[ ! -f ${${ZI[ZMODULES_DIR]}}/zpmod/COMPILED_AT || ( ${${ZI[ZMODULES_DIR]}}/zpmod/COMPILED_AT -ot ${${ZI[ZMODULES_DIR]}}/zpmod/RECOMPILE_REQUEST ) ]] {
  [[ -e ${${ZI[ZMODULES_DIR]}}/zpmod/COMPILED_AT ]] && local compiled_at_ts="$(<${${ZI[ZMODULES_DIR]}}/zpmod/COMPILED_AT)"
  [[ -e ${${ZI[ZMODULES_DIR]}}/zpmod/RECOMPILE_REQUEST ]] && local recompile_request_ts="$(<${${ZI[ZMODULES_DIR]}}/zpmod/RECOMPILE_REQUEST)"
  if [[ ${recompile_request_ts:-1} -gt ${compiled_at_ts:-0} ]] {
    +zi-message "{u-warn}WARNING{b-warn}:{rst}{msg} A {lhi}recompilation{rst}" "of the❮ ZI ❯module has been requested… {hi}Building{rst}…"
    (( ${+functions[.zi-confirm]} )) || builtin source "${ZI[BIN_DIR]}/lib/zsh/autoload.zsh" || return 1
    command make -C "${${ZI[ZMODULES_DIR]}}/zpmod" distclean &>/dev/null
    .zi-module build &>/dev/null
    if command make -C "${${ZI[ZMODULES_DIR]}}/zpmod" &>/dev/null; then
    +zi-message "{ok}Build successful!{rst}"
    else
    builtin print -r -- "${ZI[col-error]}Compilation failed.${ZI[col-rst]}" "${ZI[col-pre]}You can enter the following command:${ZI[col-rst]}" \
    'make -C ${${ZI[ZMODULES_DIR]}}/zpmod' "${ZI[col-pre]}to see the error messages and e.g.: report an issue" "at GitHub${ZI[col-rst]}"
    fi
    command date '+%s' >| "${${ZI[ZMODULES_DIR]}}/zpmod/COMPILED_AT"
  }
  }
}
@zi-register-hook "-r/--reset" hook:e-\!atpull-pre ∞zi-reset-hook
@zi-register-hook "ICE[reset]" hook:e-\!atpull-post ∞zi-reset-hook
@zi-register-hook "atpull'!'" hook:e-\!atpull-post ∞zi-atpull-e-hook
@zi-register-hook "make'!!'" hook:no-e-\!atpull-pre ∞zi-make-ee-hook
@zi-register-hook "mv''" hook:no-e-\!atpull-pre ∞zi-mv-hook
@zi-register-hook "cp''" hook:no-e-\!atpull-pre ∞zi-cp-hook
@zi-register-hook "compile-plugin" hook:no-e-\!atpull-pre ∞zi-compile-plugin-hook
@zi-register-hook "make'!'" hook:no-e-\!atpull-post ∞zi-make-e-hook
@zi-register-hook "atpull" hook:no-e-\!atpull-post ∞zi-atpull-hook
@zi-register-hook "make''" hook:no-e-\!atpull-post ∞zi-make-hook
@zi-register-hook "extract" hook:atpull-post ∞zi-extract-hook
@zi-register-hook "compile-plugin" hook:atpull-post ∞zi-compile-plugin-hook
@zi-register-hook "ps-on-update" hook:%atpull-post ∞zi-ps-on-update-hook
@zi-register-hook "make'!!'" hook:\!atclone-pre ∞zi-make-ee-hook
@zi-register-hook "mv''" hook:\!atclone-pre ∞zi-mv-hook
@zi-register-hook "cp''" hook:\!atclone-pre ∞zi-cp-hook
@zi-register-hook "compile-plugin" hook:\!atclone-pre ∞zi-compile-plugin-hook
@zi-register-hook "make'!'" hook:\!atclone-post ∞zi-make-e-hook
@zi-register-hook "atclone" hook:\!atclone-post ∞zi-atclone-hook
@zi-register-hook "make''" hook:\!atclone-post ∞zi-make-hook
@zi-register-hook "extract" hook:\!atclone-post ∞zi-extract-hook
@zi-register-hook "compile-plugin" hook:atclone-post ∞zi-compile-plugin-hook
