

builtin source "${ZI[BIN_DIR]}/lib/zsh/side.zsh" || { builtin print -P "${ZI[col-error]}ERROR:%f%b Couldn't find ${ZI[col-obj]}/lib/zsh/side.zsh%f%b."; return 1; }
ZI[EXTENDED_GLOB]=""
