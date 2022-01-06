<h2 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://raw.githubusercontent.com/z-shell/zi/main/docs/images/logo.svg" alt="Logo" width="60" height="60">
  </a>
❮ ZI ❯ Wiki

  ---
  
**A Swiss Army Knife for [Zsh](https://zsh.sourceforge.io/) - [Unix shell](https://en.wikipedia.org/wiki/Unix_shell).**

</h2>

- Has a [turbo mode](https://github.com/z-shell/zi/wiki/Introduction#turbo-mode-zsh--53) which yields 50-80% [faster](https://github.com/z-shell/pm-perf-test) Zsh startup.

- Allow to install [**RubyGems**](https://rubygems.org/) [[1](https://github.com/z-shell/zi/wiki/z-a-bin-gem-node)] [[2](https://github.com/z-shell/any-gem)], [**Node modules**](https://www.npmjs.com/) [[1](https://github.com/z-shell/zi/wiki/z-a-bin-gem-node)] [[2](https://github.com/z-shell/any-node)], [**Rust packages**](https://crates.io/) [[1](https://github.com/z-shell/zi/wiki/z-a-rust)] and almost everything from [**GitHub**](https://github.com) [[1](https://github.com/z-shell/zi/wiki/z-a-meta-plugins)] [[2](https://github.com/z-shell/zi/wiki/Gallery)] [[3](https://github.com/z-shell/zi/wiki/Annexes)] [[4](https://github.com/z-shell/zi/wiki/Packages)].

- Supports loading [Oh My Zsh and Prezto](https://github.com/z-shell/zi/wiki/Introduction#oh-my-zsh-prezto) plugins and libraries, however, the implementation isn't framework-specific and doesn't bloat the plugin manager with such code. See our wiki on how to [migrate](https://github.com/z-shell/zi/wiki/Usage#migration) from other plugin managers.

- The dedicated [packages](https://github.com/z-shell/zi/wiki/Packages/) that offload the user from providing long and complex commands. See the [Z-Shell ZI](https://github.com/z-shell) organization for a complete list of packages.

- The specialized extensions — called [annexes](https://github.com/z-shell/zi/wiki/Annexes/) — allow to extend the plugin manager with new commands, URL-preprocessors (used by e.g.: [z-a-readurl](https://github.com/z-shell/z-a-readurl) annex), post-install and post-update hooks and much more.

<div align="center">
<a href="https://asciinema.org/a/459358" target="_blank"><img src="https://asciinema.org/a/459358.svg" width="85%" /></a>
</div>

- The system does not use `$FPATH`, loading multiple plugins don't clutter `$FPATH` with the same number of entries (e.g. `10`, `15` or more). Code is immune to `KSH_ARRAYS` and other options typically causing compatibility problems.

- Provides [reports and statistics](https://github.com/z-shell/zi/wiki/Commands#reports-and-statistics) about the plugins, such as describing what **aliases**, **functions**, **bindkeys**, **Zle widgets**, **zstyles**, [completions](https://github.com/z-shell/zi/wiki/Introduction#completion-management), variables, `PATH` and `FPATH` elements a plugin has set up. Allows to quickly [familiarize](https://github.com/z-shell/zi/wiki/Profiling-plugins) oneself with a new plugin and provides rich and easy-to-digest information that might be helpful on various occasions. supports the unloading of plugins and the ability to list, (un)install, and **selectively disable**, **enable** plugin's completions.

- Test configurations with docker at [playground](https://github.com/z-shell/playground)
