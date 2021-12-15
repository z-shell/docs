<h1 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://raw.githubusercontent.com/z-shell/zi/main/docs/images/logo.svg" alt="Logo" width="80" height="80">
  </a>
❮ ZI ❯ Wiki
</h1>

---

**ZI is a flexible and fast feature-rich Zshell plugin manager that will allow you to
install everything from GitHub and other sites. Its characteristics are:**

1. ZI is currently the only plugin manager out there that provides Turbo mode
   which yields **50-80% faster Zsh startup** (i.e.: the shell will start up to
   **5** times faster!). Check out a speed comparison with other popular plugin
   managers [here](https://github.com/z-shell/pm-perf-test).

2. The plugin manager gives **reports** from plugin loadings describing what
   **aliases**, functions, **bindkeys**, Zle widgets, zstyles, **completions**,
   variables, `PATH` and `FPATH` elements a plugin has set up. This allows to
   quickly familiarize oneself with a new plugin and provides rich and easy to
   digest information that might be helpful on various occasions.

3. Supported is unloading of plugin and ability to list, (un)install and
   **selectively disable**, **enable** plugin's completions.

4. The plugin manager supports loading Oh My Zsh and Prezto plugins and
   libraries, however, the implementation isn't framework-specific and doesn't
   bloat the plugin manager with such code (more on this topic can be found on
   the Wiki, in the
   [Introduction](https://github.com/z-shell/zi/wiki/Introduction#oh-my-zsh-prezto).

5. The system does not use `$FPATH`, loading multiple plugins don't clutter
   `$FPATH` with the same number of entries (e.g. `10`, `15` or more). Code is
   immune to `KSH_ARRAYS` and other options typically causing compatibility
   problems.

6. ZI supports special, dedicated **packages** that offload the user from
   providing long and complex commands. See the
   [Z-shell](https://github.com/z-shell) organization for a growing,
   complete list of ZI packages and the [Wiki
   page](https://github.com/z-shell/zi/wiki/Packages/) for an article about
   the feature.

7. Also, specialized ZI extensions — called **annexes** — allow to extend the
   plugin manager with new commands, URL-preprocessors (used by e.g.:
   [z-a-readurl](https://github.com/z-shell/z-a-readurl) annex),
   post-install and post-update hooks and much more. See the
   [z-shell](https://github.com/z-shell) organization for a growing,
   complete list of available ZI extensions and refer to the [Wiki
   article](https://github.com/z-shell/zi/wiki/Annexes/) for an introduction on
   creating your own annex.

[![asciicast](https://asciinema.org/a/QcC3gmoOqIkMdPJ7J9v6hiWGf.svg)](https://asciinema.org/a/QcC3gmoOqIkMdPJ7J9v6hiWGf)

**Here is the list of people who contributed to documentation so far:**

- [ss-o](https://github.com/ss-o)
- [wicoop](https://github.com/ss-o/wicoop)
- [dec0dOS](https://github.com/dec0dOS)
