The files will be processed and their documentation will be generated
in subdirectory `zsdoc` (with meta-data in subdirectory `data`).

> Supported are Bash and Zsh scripts.

- Reading configuration from: `/usr/local/share/zsdoc/zsd.config`
- Zsh control binary is: `zsh`
- Usage: `zsd [-h/--help] [-v/--verbose] [-q/--quiet] [-n/--noansi] [--cignore <pattern>] {file1} [file2] ...`

Options:

```shell
-h/--help     # Usage information
-v/--verbose  # More verbose operation-status output
-q/--quiet    # No status messages
-n/--noansi   # No colors in terminal output
--cignore     # Specify which comment lines should be ignored
-f/--fpath    # Paths separated by : pointing to directories with functions
--synopsis    # Text to be used in SYNOPSIS section. Line break "... +\n", paragraph "...\n\n"
--blocka      # String used as block-begin, default: {{{
--blockb      # String used as block-end, default: }}}
--scomm       # Strip comment char "#" from function comments
--bash        # Output slightly tailored to Bash specifics (instead of Zsh specifics)
```

Example --cignore options:

```shell
--cignore '#*FUNCTION:*{{{*'                 - ignore comments like: # FUNCTION: usage {{{
--cignore '(#*FUNCTION:*{{{*|#*FUN:*{{{*)'   - also ignore comments like: # FUN: usage {{{
```

File is parsed for synopsis block, which can be e.g.:

```shell
# synopsis {{{my synopsis, can be multi-line}}}
```

    Other block that is parsed is commenting on environment variables. There can be multiple such blocks,

their content will be merged. Single block consists of multiple 'VAR_NAME -> var-description' lines
and results in a table in the output AsciiDoc document. An example block:

```shell
# env-vars {{{
# PATH -> paths to executables
# MANPATH -> paths to manuals }}}
```

    Change the default brace block-delimeters with --blocka, --blockb. Block body should be AsciiDoc.
