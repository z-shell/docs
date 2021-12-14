# Copyright (c) 2016-2020 Sebastian Gniazdowski and contributors.
# Copyright (c) 2021 Salvydas Lukosius and Z-Shell ZI contributors.

# FUNCTION: .zi-exists-physically [[[
# Checks if directory of given plugin exists in PLUGIN_DIR.
#
# Testable.
#
# $1 - plugin spec (4 formats: user---plugin, user/plugin, user, plugin)
# $2 - plugin (only when $1 - i.e. user - given)
.zi-exists-physically() {
  .zi-any-to-user-plugin "$1" "$2"
  if [[ ${reply[-2]} = % ]]; then
    [[ -d ${reply[-1]} ]] && return 0 || return 1
  else
  [[ -d ${ZI[PLUGINS_DIR]}/${reply[-2]:+${reply[-2]}---}${reply[-1]//\//---} ]] && return 0 || return 1
  fi
} # ]]]
# FUNCTION: .zi-exists-physically-message [[[
# Checks if directory of given plugin exists in PLUGIN_DIR, and outputs error message if it doesn't.
#
# Testable.
#
# $1 - plugin spec (4 formats: user---plugin, user/plugin, user, plugin)
# $2 - plugin (only when $1 - i.e. user - given)
.zi-exists-physically-message() {
  builtin emulate -LR zsh
  builtin setopt extendedglob warncreateglobal typesetsilent noshortloops rcquotes
  if ! .zi-exists-physically "$1" "$2"; then
    .zi-any-to-user-plugin "$1" "$2"
    if [[ $reply[1] = % ]] {
      .zi-any-to-pid "$1" "$2"
      local spec1=$REPLY
      if [[ $1 = %* ]] {
        local spec2=%${1#%}${${1#%}:+${2:+/}}$2
      } elif [[ -z $1 || -z $2 ]] {
        local spec3=%${1#%}${2#%}
      }
    } else {
      integer nospec=1
    }
    .zi-any-colorify-as-uspl2 "$1" "$2"

    +zi-message "{error}No such (plugin or snippet){rst}: $REPLY."
    [[ $nospec -eq 0 && $spec1 != $spec2 ]] && +zi-message "(expands to: {file}${spec2#%}{rst})."
    return 1
  fi
  return 0
} # ]]]
# FUNCTION: .zi-first [[[
# Finds the main file of plugin. There are multiple file name formats, they are ordered in order starting from more correct
# ones, and matched. .zi-load-plugin() has similar code parts and doesn't call .zi-first() – for performance. Obscure matching
# is done in .zi-find-other-matches, here and in .zi-load(). Obscure = non-standard main-file naming convention.
#
# $1 - plugin spec (4 formats: user---plugin, user/plugin, user, plugin)
# $2 - plugin (only when $1 - i.e. user - given)
.zi-first() {
  .zi-any-to-user-plugin "$1" "$2"
  local user="${reply[-2]}" plugin="${reply[-1]}"

  .zi-any-to-pid "$1" "$2"
  .zi-get-object-path plugin "$REPLY"
  integer ret=$?
  local dname="$REPLY"
  (( ret )) && { reply=( "$dname" "" ); return 1; }
  # Look for file to compile. First look for the most common one
  # (optimization) then for other possibilities
  if [[ -e "$dname/$plugin.plugin.zsh" ]]; then
    reply=( "$dname/$plugin.plugin.zsh" )
  else
    .zi-find-other-matches "$dname" "$plugin"
  fi
  if [[ "${#reply}" -eq "0" ]]; then
    reply=( "$dname" "" )
    return 1
  fi
  # Take first entry (ksharrays resilience)
  reply=( "$dname" "${reply[-${#reply}]}" )
  return 0
} # ]]]
# FUNCTION: .zi-any-colorify-as-uspl2 [[[
# Returns ANSI-colorified "user/plugin" string, from any supported plugin spec (user---plugin, user/plugin, user plugin, plugin).
#
# $1 - plugin spec (4 formats: user---plugin, user/plugin, user, plugin)
# $2 - plugin (only when $1 - i.e. user - given)
# $REPLY = ANSI-colorified "user/plugin" string
.zi-any-colorify-as-uspl2() {
  .zi-any-to-user-plugin "$1" "$2"
  local user="${reply[-2]}" plugin="${reply[-1]}"
  if [[ "$user" = "%" ]] {
    .zi-any-to-pid "" $plugin
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--plugins--/OMZP::}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--plugins/OMZP}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--lib--/OMZL::}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--lib/OMZL}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--themes--/OMZT::}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--themes/OMZT}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk--/OMZ::}"
    REPLY="${REPLY/https--github.com--(robbyrussell--oh-my-zsh|ohmyzsh--ohmyzsh)--trunk/OMZ}"
    REPLY="${REPLY/https--github.com--sorin-ionescu--prezto--trunk--modules--/PZTM::}"
    REPLY="${REPLY/https--github.com--sorin-ionescu--prezto--trunk--modules/PZTM}"
    REPLY="${REPLY/https--github.com--sorin-ionescu--prezto--trunk--/PZT::}"
    REPLY="${REPLY/https--github.com--sorin-ionescu--prezto--trunk/PZT}"
    REPLY="${REPLY/(#b)%([A-Z]##)(#c0,1)(*)/%$ZI[col-uname]$match[1]$ZI[col-pname]$match[2]$ZI[col-rst]}"
  } elif [[ $user == http(|s): ]] {
    REPLY="${ZI[col-ice]}${user}/${plugin}${ZI[col-rst]}"
  } else {
    REPLY="${user:+${ZI[col-uname]}${user}${ZI[col-rst]}/}${ZI[col-pname]}${plugin}${ZI[col-rst]}"
  }
} # ]]]
# FUNCTION: .zi-two-paths [[[
# Obtains a snippet URL without specification if it is an SVN URL (points to directory) or regular URL (points to file),
# returns 2 possible paths for further examination
.zi-two-paths() {
  emulate -LR zsh
  setopt extendedglob typesetsilent warncreateglobal noshortloops

  local url=$1 url1 url2 local_dirA dirnameA svn_dirA local_dirB dirnameB
  local -a fileB_there
  # Remove leading whitespace and trailing /
  url="${${url#"${url%%[! $'\t']*}"}%/}"
  url1=$url url2=$url

  .zi-get-object-path snippet "$url1"
  local_dirA=$reply[-3] dirnameA=$reply[-2]
  [[ -d "$local_dirA/$dirnameA/.svn" ]] && {
    svn_dirA=".svn"
    if { .zi-first % "$local_dirA/$dirnameA"; } {
      fileB_there=( ${reply[-1]} )
    }
  }

  .zi-get-object-path snippet "$url2"
  local_dirB=$reply[-3] dirnameB=$reply[-2]
  [[ -z $svn_dirA ]] && \
    fileB_there=( "$local_dirB/$dirnameB"/*~*.(zwc|md|js|html)(.-DOnN[1]) )
  reply=( "$local_dirA/$dirnameA" "$svn_dirA" "$local_dirB/$dirnameB" "${fileB_there[1]##$local_dirB/$dirnameB/#}" )
} # ]]]
# FUNCTION: .zi-compute-ice [[[
# Computes ICE array (default, it can be specified via $3) from a) input ICE, b) static ice, c) saved ice,
# taking priorities into account. Also returns path to snippet directory and optional name of snippet file
# (only valid if ICE[svn] is not set).
#
# Can also pack resulting ices into ZI_SICE (see $2).
#
# $1 - URL (also plugin-spec)
# $2 - "pack" or "nopack" or "pack-nf" - packing means ICE
#      wins with static ice; "pack-nf" means that disk-ices will
#      be ignored (no-file?)
# $3 - name of output associative array, "ICE" is the default
# $4 - name of output string parameter, to hold path to directory ("local_dir")
# $5 - name of output string parameter, to hold filename ("filename")
# $6 - name of output string parameter, to hold is-snippet 0/1-bool ("is_snippet")
.zi-compute-ice() {
  emulate -LR zsh
  setopt extendedglob typesetsilent warncreateglobal noshortloops

  local ___URL="${1%/}" ___pack="$2" ___is_snippet=0
  local ___var_name1="${3:-ZI_ICE}" ___var_name2="${4:-local_dir}" ___var_name3="${5:-filename}" ___var_name4="${6:-is_snippet}"
  # Copy from .zi-recall
  local -a ice_order nval_ices
  ice_order=(
  ${(s.|.)ZI[ice-list]}
  # Include all additional ices – after stripping them from the possible: ''
  ${(@)${(@Akons:|:)${ZI_EXTS[ice-mods]//\'\'/}}/(#s)<->-/}
  )
  nval_ices=(
  ${(s.|.)ZI[nval-ice-list]}
  # Include only those additional ices, don't have the '' in their name, i.e aren't designed to hold value
  ${(@)${(@)${(@Akons:|:)ZI_EXTS[ice-mods]}:#*\'\'*}/(#s)<->-/}
  # Must be last
  svn
  )
  # Remove whitespace from beginning of URL
  ___URL="${${___URL#"${___URL%%[! $'\t']*}"}%/}"
  # Snippet?
  .zi-two-paths "$___URL"
  local ___s_path="${reply[-4]}" ___s_svn="${reply[-3]}" ___path="${reply[-2]}" ___filename="${reply[-1]}" ___local_dir
  if [[ -d "$___s_path" || -d "$___path" ]]; then
    ___is_snippet=1
  else
  # Plugin
  .zi-any-to-user-plugin "$___URL" ""
  local ___user="${reply[-2]}" ___plugin="${reply[-1]}"
  ___s_path="" ___filename=""
  [[ "$___user" = "%" ]] && ___path="$___plugin" || ___path="${ZI[PLUGINS_DIR]}/${___user:+${___user}---}${___plugin//\//---}"
  .zi-exists-physically-message "$___user" "$___plugin" || return 1
  fi
  [[ $___pack = pack* ]] && (( ${#ICE} > 0 )) && .zi-pack-ice "${___user-$___URL}" "$___plugin"
  local -A ___sice
  local -a ___tmp
  ___tmp=( "${(z@)ZI_SICE[${___user-$___URL}${${___user:#(%|/)*}:+/}$___plugin]}" )
  (( ${#___tmp[@]} > 1 && ${#___tmp[@]} % 2 == 0 )) && ___sice=( "${(Q)___tmp[@]}" )

  if [[ "${+___sice[svn]}" = "1" || -n "$___s_svn" ]]; then
    if (( !___is_snippet && ${+___sice[svn]} == 1 )); then
      builtin print -r -- "The \`svn' ice is given, but the argument ($___URL) is a plugin"
      builtin print -r -- "(\`svn' can be used only with snippets)"
      return 1
    elif (( !___is_snippet )); then
      builtin print -r -- "Undefined behavior #1 occurred, please report at https://github.com/z-shell/zi/issues"
      return 1
    fi
    if [[ -e "$___s_path" && -n "$___s_svn" ]]; then
      ___sice[svn]=""
      ___local_dir="$___s_path"
    else
      [[ ! -e "$___path" ]] && { builtin print -r -- "No such snippet, looked at paths (1): $___s_path, and: $___path"; return 1; }
      unset '___sice[svn]'
      ___local_dir="$___path"
    fi
  else
    if [[ -e "$___path" ]]; then
      unset '___sice[svn]'
      ___local_dir="$___path"
    else
      builtin print -r -- "No such snippet, looked at paths (2): $___s_path, and: $___path"
      return 1
    fi
  fi

  local ___zi_path="$___local_dir/._zi"

  # Rename Zplugin > ZI
  if [[ ! -d $___zi_path && -d $___local_dir/._zplugin ]]; then
    (
    builtin print -Pr -- "${ZI[col-pre]}UPGRADING THE DIRECTORY STRUCTURE" "FOR THE ZPLUGIN -> ZI RENAME…%f"
    builtin cd -q ${ZI[PLUGINS_DIR]} || return 1
    autoload -Uz zmv
    ( zmv -W '**/._zplugin' '**/._zi' ) &>/dev/null
    builtin cd -q ${ZI[SNIPPETS_DIR]} || return 1
    ( zmv -W '**/._zplugin' '**/._zi' ) &>/dev/null
    builtin print -Pr -- "${ZI[col-obj]}THE UPGRADE SUCCEDED!%f"
    ) || builtin print -Pr -- "${ZI[col-error]}THE UPGRADE FAILED!%f"
  fi

  # Rename Zinit > ZI
  if [[ ! -d $___zi_path && -d $___local_dir/._zinit ]]; then
    (
      builtin print -Pr -- "${ZI[col-pre]}UPGRADING THE DIRECTORY STRUCTURE" "FOR THE ZI -> ZI RENAME…%f"
      builtin cd -q ${ZI[PLUGINS_DIR]} || return 1
      autoload -Uz zmv
      ( zmv -W '**/.zinit' '**/._zi' ) &>/dev/null
      builtin cd -q ${ZI[SNIPPETS_DIR]} || return 1
      ( zmv -W '**/._zinit' '**/._zi' ) &>/dev/null
      builtin print -Pr -- "${ZI[col-obj]}THE UPGRADE SUCCEDED!%f"
    ) || builtin print -Pr -- "${ZI[col-error]}THE UPGRADE FAILED!%f"
  fi

  # Read disk-Ice
  local -A ___mdata
  local ___key
  { for ___key in mode url is_release is_release{2..5} ${ice_order[@]}; do
    [[ -f "$___zi_path/$___key" ]] && ___mdata[$___key]="$(<$___zi_path/$___key)"
  done
    [[ "${___mdata[mode]}" = "1" ]] && ___mdata[svn]=""
  } 2>/dev/null
  # Handle flag-Ices; svn must be last
  for ___key in ${ice_order[@]}; do
    [[ $___key == (no|)compile ]] && continue
    (( 0 == ${+ICE[no$___key]} && 0 == ${+___sice[no$___key]} )) && continue
    # "If there is such ice currently, and there's no no* ice given, and there's the no* ice in the static ice" – skip, don't unset.
    # With conjunction with the previous line this has the proper meaning: uset if at least in one – current or static – ice
    # there's the no* ice, but not if it's only in the static ice (unless there's on such ice "anyway").
    (( 1 == ${+ICE[$___key]} && 0 == ${+ICE[no$___key]} && 1 == ${+___sice[no$___key]} )) && continue
    if [[ "$___key" = "svn" ]]; then
      command builtin print -r -- "0" >! "$___zi_path/mode"
      ___mdata[mode]=0
    else
      command rm -f -- "$___zi_path/$___key"
    fi
    unset "___mdata[$___key]" "___sice[$___key]" "ICE[$___key]"
  done

  # Final decision, static ice vs. saved ice
  local -A ___MY_ICE
  for ___key in mode url is_release is_release{2..5} ${ice_order[@]}; do
  # The second sum is: if the pack is *not* pack-nf, then depending on the disk availability, otherwise: no disk ice
    (( ${+___sice[$___key]} + ${${${___pack:#pack-nf*}:+${+___mdata[$___key]}}:-0} )) && ___MY_ICE[$___key]="${___sice[$___key]-${___mdata[$___key]}}"
  done
  # One more round for the special case – update, which ALWAYS needs the teleid from the disk or static ice
  ___key=teleid; [[ "$___pack" = pack-nftid ]] && {
    (( ${+___sice[$___key]} + ${+___mdata[$___key]} )) && ___MY_ICE[$___key]="${___sice[$___key]-${___mdata[$___key]}}"
  }

  : ${(PA)___var_name1::="${(kv)___MY_ICE[@]}"}
  : ${(P)___var_name2::=$___local_dir}
  : ${(P)___var_name3::=$___filename}
  : ${(P)___var_name4::=$___is_snippet}

  return 0
} # ]]]
# FUNCTION: .zi-store-ices [[[
# Saves ice mods in given hash onto disk.
#
# $1 - directory where to create / delete files
# $2 - name of hash that holds values
# $3 - additional keys of hash to store, space separated
# $4 - additional keys of hash to store, empty-meaningful ices, space separated
# $5 - the URL, if applicable
# $6 - the mode (1 - svn, 0 - single file), if applicable
.zi-store-ices() {
  local ___pfx="$1" ___ice_var="$2" ___add_ices="$3" ___add_ices2="$4" url="$5" mode="$6"
  # Copy from .zi-recall
  local -a ice_order nval_ices
  ice_order=(
    ${(s.|.)ZI[ice-list]}
  # Include all additional ices – after stripping them from the possible: ''
    ${(@)${(@Akons:|:)${ZI_EXTS[ice-mods]//\'\'/}}/(#s)<->-/}
  )
  nval_ices=(
  ${(s.|.)ZI[nval-ice-list]}
  # Include only those additional ices, don't have the '' in their name, i.e. aren't designed to hold value
  ${(@)${(@)${(@Akons:|:)ZI_EXTS[ice-mods]}:#*\'\'*}/(#s)<->-/}
  # Must be last
  svn
  )
  command mkdir -p "$___pfx"
  local ___key ___var_name
  # No nval_ices here
  for ___key in ${ice_order[@]:#(${(~j:|:)nval_ices[@]})} ${(s: :)___add_ices[@]}; do
    ___var_name="${___ice_var}[$___key]"
    (( ${(P)+___var_name} )) && builtin print -r -- "${(P)___var_name}" >! "$___pfx"/"$___key"
  done
  # Ices that even empty mean something
  for ___key in ${nval_ices[@]} ${(s: :)___add_ices2[@]}; do
    ___var_name="${___ice_var}[$___key]"
    if (( ${(P)+___var_name} )) {
      builtin print -r -- "${(P)___var_name}" >! "$___pfx"/"$___key"
    } else {
      command rm -f "$___pfx"/"$___key"
    }
  done
  # url and mode are declared at the beginning of the body
  for ___key in url mode; do
    [[ -n "${(P)___key}" ]] && builtin print -r -- "${(P)___key}" >! "$___pfx"/"$___key"
  done
} # ]]]
# FUNCTION: .zi-countdown [[[
# Displays a countdown 5...4... etc. and returns 0 if it
# sucessfully reaches 0, or 1 if Ctrl-C will be pressed.
.zi-countdown() {
  (( !${+ICE[countdown]} )) && return 0
  emulate -L zsh -o extendedglob
  trap "+zi-message \"{ehi}ABORTING, the ice {ice}$ice{ehi} not ran{rst}\"; return 1" INT
  local count=5 tpe="$1" ice
  ice="${ICE[$tpe]}"
  [[ $tpe = "atpull" && $ice = "%atclone" ]] && ice="${ICE[atclone]}"
  ice="{b}{ice}$tpe{ehi}:{rst}${ice//(#b)(\{[a-z0-9…–_-]##\})/\\$match[1]}"
  +zi-message -n "{hi}Running $ice{rst}{hi} ice in...{rst} "
  while (( -- count + 1 )) {
    +zi-message -n -- "{b}{error}"$(( count + 1 ))"{rst}{…}"
    sleep 1
  }
  +zi-message -r -- "{b}{error}0 <running now>{rst}{…}"
  return 0
} # ]]]


# function zmv {
# zmv, zcp, zln:
#
# This is a multiple move based on zsh pattern matching.  To get the full
# power of it, you need a postgraduate degree in zsh.  However, simple
# tasks work OK, so if that's all you need, here are some basic examples:
#   zmv '(*).txt' '$1.lis'
# Rename foo.txt to foo.lis, etc.  The parenthesis is the thing that
# gets replaced by the $1 (not the `*', as happens in mmv, and note the
# `$', not `=', so that you need to quote both words).
zmv() {
# function zmv {
# zmv, zcp, zln:
#
# This is a multiple move based on zsh pattern matching.  To get the full
# power of it, you need a postgraduate degree in zsh.  However, simple
# tasks work OK, so if that's all you need, here are some basic examples:
#   zmv '(*).txt' '$1.lis'
# Rename foo.txt to foo.lis, etc.  The parenthesis is the thing that
# gets replaced by the $1 (not the `*', as happens in mmv, and note the
# `$', not `=', so that you need to quote both words).
#   zmv '(**/)(*).txt '$1$2.lis'
# The same, but scanning through subdirectories.  The $1 becomes the full
# path.  Note that you need to write it like this; you can't get away with
# '(**/*).txt'.
#   zmv -w '**/*.txt' '$1$2.lis'
#   noglob zmv -W **/*.txt **/*.lis
# These are the lazy version of the one above; with -w, zsh inserts the
# parentheses for you in the search pattern, and with -W it also inserts
# the numbered variables for you in the replacement pattern.  The catch
# in the first version is that you don't need the / in the replacement
# pattern.  (It's not really a catch, since $1 can be empty.)  Note that
# -W actually inserts ${1}, ${2}, etc., so it works even if you put a
# number after a wildcard (such as zmv -W '*1.txt' '*2.txt').
#   zmv -C '**/(*).txt' ~/save/'$1'.lis
# Copy, instead of move, all .txt files in subdirectories to .lis files
# in the single directory `~/save'.  Note that the ~ was not quoted.
# You can test things safely by using the `-n' (no, not now) option.
# Clashes, where multiple files are renamed or copied to the same one, are
# picked up.
#
# Here's a more detailed description.
#
# Use zsh pattern matching to move, copy or link files, depending on
# the last two characters of the function name.  The general syntax is
#   zmv '<inpat>' '<outstring>'
# <inpat> is a globbing pattern, so it should be quoted to prevent it from
# immediate expansion, while <outstring> is a string that will be
# re-evaluated and hence may contain parameter substitutions, which should
# also be quoted.  Each set of parentheses in <inpat> (apart from those
# around glob qualifiers, if you use the -Q option, and globbing flags) may
# be referred to by a positional parameter in <outstring>, i.e. the first
# (...) matched is given by $1, and so on.  For example,
#   zmv '([a-z])(*).txt' '${(C)1}$2.txt'
# renames algernon.txt to Algernon.txt, boris.txt to Boris.txt and so on.
# The original file matched can be referred to as $f in the second
# argument; accidental or deliberate use of other parameters is at owner's
# risk and is not covered by the (non-existent) guarantee.
#
# As usual in zsh, /'s don't work inside parentheses.  There is a special
# case for (**/) and (***/):  these have the expected effect that the
# entire relevant path will be substituted by the appropriate positional
# parameter.
#
# There is a shortcut avoiding the use of parenthesis with the option -w
# (with wildcards), which picks out any expressions `*', `?', `<range>'
# (<->, <1-10>, etc.), `[...]', possibly followed by `#'s, `**/', `***/', and
# automatically parenthesises them. (You should quote any ['s or ]'s which
# appear inside [...] and which do not come from ranges of the form
# `[:alpha:]'.)  So for example, in
#    zmv -w '[[:upper:]]*' '${(L)1}$2'
# the $1 refers to the expression `[[:upper:]]' and the $2 refers to
# `*'. Thus this finds any file with an upper case first character and
# renames it to one with a lowercase first character.  Note that any
# existing parentheses are active, too, so you must count accordingly.
# Furthermore, an expression like '(?)' will be rewritten as '((?))' --- in
# other words, parenthesising of wildcards is independent of any existing
# parentheses.
#
# Any file whose name is not changed by the substitution is simply ignored.
# Any error --- a substitution resulted in an empty string, two
# substitutions gave the same result, the destination was an existing
# regular file and -f was not given --- causes the entire function to abort
# without doing anything.
#
# Options:
#  -f  force overwriting of destination files.  Not currently passed
#      down to the mv/cp/ln command due to vagaries of implementations
#      (but you can use -o-f to do that).
#  -i  interactive: show each line to be executed and ask the user whether
#      to execute it.  Y or y will execute it, anything else will skip it.
#      Note that you just need to type one character.
#  -n  no execution: print what would happen, but don't do it.
#  -q  Turn bare glob qualifiers off:  now assumed by default, so this
#      has no effect.
#  -Q  Force bare glob qualifiers on.  Don't turn this on unless you are
#      actually using glob qualifiers in a pattern (see below).
#  -s  symbolic, passed down to ln; only works with zln or z?? -L.
#  -v  verbose: print line as it's being executed.
#  -o <optstring>
#      <optstring> will be split into words and passed down verbatim
#      to the cp, ln or mv called to perform the work.  It will probably
#      begin with a `-'.
#  -p <program>
#      Call <program> instead of cp, ln or mv.  Whatever it does, it should
#      at least understand the form '<program> -- <oldname> <newname>',
#      where <oldname> and <newname> are filenames generated. <program>
#      will be split into words.
#  -P <program>
#      As -p, but the program doesn't understand the "--" convention.
#      In this case the file names must already be sane.
#  -w  Pick out wildcard parts of the pattern, as described above, and
#      implicitly add parentheses for referring to them.
#  -W  Just like -w, with the addition of turning wildcards in the
#      replacement pattern into sequential ${1} .. ${N} references.
#  -C
#  -L
#  -M  Force cp, ln or mv, respectively, regardless of the name of the
#      function.
#
# Bugs:
#   Parenthesised expressions can be confused with glob qualifiers, for
#   example a trailing '(*)' would be treated as a glob qualifier in
#   ordinary globbing.  This has proved so annoying that glob qualifiers
#   are now turned off by default.  To force the use of glob qualifiers,
#   give the flag -Q.
#
#   The pattern is always treated as an extendedglob pattern.  This
#   can also be interpreted as a feature.
#
# Unbugs:
#   You don't need braces around the 1 in expressions like '$1t' as
#   non-positional parameters may not start with a number, although
#   paranoiacs like the author will probably put them there anyway.

emulate -RL zsh
setopt extendedglob

local f g args match mbegin mend files action myname tmpf opt exec
local opt_f opt_i opt_n opt_q opt_Q opt_s opt_M opt_C opt_L 
local opt_o opt_p opt_P opt_v opt_w opt_W MATCH MBEGIN MEND
local pat repl errstr fpat hasglobqual opat
typeset -A from to
integer stat

local dashes=--

myname=${(%):-%N}

while getopts ":o:p:P:MCLfinqQsvwW" opt; do
  if [[ $opt = "?" ]]; then
    print -r -- "$myname: unrecognized option: -$OPTARG" >&2
    return 1
  fi
  eval "opt_$opt=\${OPTARG:--\$opt}"
done
(( OPTIND > 1 )) && shift $(( OPTIND - 1 ))

[[ -z $opt_Q ]] && setopt nobareglobqual
[[ -n $opt_M ]] && action=mv
[[ -n $opt_C ]] && action=cp
[[ -n $opt_L ]] && action=ln
[[ -n $opt_p ]] && action=$opt_p
[[ -n $opt_P ]] && action=$opt_P dashes=

if [[ -z $action ]]; then
  action=$myname[-2,-1]

  if [[ $action != (cp|mv|ln) ]]; then
    print -r "$myname: action $action not recognised: must be cp, mv or ln." >&2
    return 1
  fi
fi

if (( $# != 2 )); then
  print -P "Usage:
  %N [OPTIONS] oldpattern newpattern
where oldpattern contains parenthesis surrounding patterns which will
be replaced in turn by \$1, \$2, ... in newpattern.  For example,
  %N '(*).lis' '\$1.txt'
renames 'foo.lis' to 'foo.txt', 'my.old.stuff.lis' to 'my.old.stuff.txt',
and so on.  Something simpler (for basic commands) is the -W option:
  %N -W '*.lis' '*.txt'
This does the same thing as the first command, but with automatic conversion
of the wildcards into the appropriate syntax.  If you combine this with
noglob, you don't even need to quote the arguments.  For example,
  alias mmv='noglob zmv -W'
  mmv *.c.orig orig/*.c" >&2
  return 1
fi

pat=$1
repl=$2
shift 2

if [[ -n $opt_s && $action != ln ]]; then
  print -r -- "$myname: invalid option: -s" >&2
  return 1
fi

if [[ -n $opt_w || -n $opt_W ]]; then
  # Parenthesise all wildcards.
  local tmp find
  integer cnt=0
  # Well, this seems to work.
  # The tricky bit is getting all forms of [...] correct, but as long
  # as we require inactive bits to be backslashed its not so bad.
  find='(#m)((\*\*##/|[*?]|<[0-9]#-[0-9]#>|\[(^|)(\]|)(\[:[a-z]##:\]|\\?|[^\]])##\])\##|?\###)'
  tmp="${pat//${~find}/$[++cnt]}"
  if [[ $cnt = 0 ]]; then
    print -r -- "$myname: warning: no wildcards were found in search pattern" >&2
  else
    pat="${pat//${~find}/($MATCH)}"
  fi
  if [[ -n $opt_W ]]; then
    # Turn wildcards into ${1} .. ${N} references.
    local open='${' close='}'
    integer N=0
    repl="${repl//${~find}/$open$[++N]$close}"
    if [[ $N != $cnt ]]; then
      print -P "%N: error: number of wildcards in each pattern must match" >&2
      return 1
    fi
    if [[ $N = 0 ]]; then
      print -P "%N: warning: no wildcards were found in replacement pattern" >&2
    fi
  fi
fi

if [[ -n $opt_Q && $pat = (#b)(*)\([^\)\|\~]##\) ]]; then
  hasglobqual=q
  # strip off qualifiers for use as ordinary pattern
  opat=$match[1]
fi

if [[ $pat = (#b)(*)\((\*\*##/)\)(*) ]]; then
  fpat="$match[1]$match[2]$match[3]"
  # Now make sure we do depth-first searching.
  # This is so that the names of any files are altered before the
  # names of the directories they are in.
  if [[ -n $opt_Q && -n $hasglobqual ]]; then
    fpat[-1]="odon)"
  else
    setopt bareglobqual
    fpat="${fpat}(odon)"
  fi
else
  fpat=$pat
fi
files=(${~fpat})

[[ -n $hasglobqual ]] && pat=$opat

errs=()

for f in $files; do
  if [[ $pat = (#b)(*)\(\*\*##/\)(*) ]]; then
    # This looks like a recursive glob.  This isn't good enough,
    # because we should really enforce that $match[1] and $match[2]
    # don't match slashes unless they were explicitly given.  But
    # it's a start.  It's fine for the classic case where (**/) is
    # at the start of the pattern.
    pat="$match[1](*/|)$match[2]"
  fi
  [[ -e $f && $f = (#b)${~pat} ]] || continue
  set -- "$match[@]"
  { {
    g=${(Xe)repl}
  } 2> /dev/null } always {
    if (( TRY_BLOCK_ERROR )); then
      print -r -- "$myname: syntax error in replacement" >&2
      return 1
    fi
  }
  if [[ -z $g ]]; then
    errs+=("\`$f' expanded to an empty string")
  elif [[ $f = $g ]]; then
    # don't cause error: more useful just to skip
    #   errs=($errs "$f not altered by substitution")
    [[ -n $opt_v ]] && print -r -- "$f not altered, ignored"
    continue
  elif [[ -n $from[$g] && ! -d $g ]]; then
    errs+=("$f and $from[$g] both map to $g")
  elif [[ -f $g && -z $opt_f && ! ($f -ef $g && $action = mv) ]]; then
    errs+=("file exists: $g")
  fi
  from[$g]=$f
  to[$f]=$g
done

if (( $#errs )); then
  print -r -- "$myname: error(s) in substitution:" >&2
  print -lr -- $errs >&2
  return 1
fi

for f in $files; do
  [[ -z $to[$f] ]] && continue
  exec=(${=action} ${=opt_o} $opt_s $dashes $f $to[$f])
  [[ -n $opt_i$opt_n$opt_v ]] && print -r -- ${(q-)exec}
  if [[ -n $opt_i ]]; then
    read -q 'opt?Execute? ' || continue
  fi
  if [[ -z $opt_n ]]; then
    $exec || stat=1
  fi
done

return $stat
# }
}
