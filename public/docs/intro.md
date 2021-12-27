---
sidebar_position: 1
title: ❮ ZI ❯ Wiki
slug: /wiki
---

<div align="center">
<a href="https://github.com/z-shell/zi"><img src="https://raw.githubusercontent.com/z-shell/zi/main/docs/images/logo.svg" alt="Logo" width="100" height="100"></img></a>
</div>

<h3><div align="center">

**ZI is a fast and feature-rich plugin manager for [Zsh](https://zsh.sourceforge.io/) - [Unix shell](https://en.wikipedia.org/wiki/Unix_shell).**

</div></h3>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs>
  <TabItem value="gems" label="RubyGems">

Install [RubyGems](https://rubygems.org):

[Annex Bin-Gem-Node](https://github.com/z-shell/zi/wiki/z-a-bin-gem-node) | [Package Any Gem](https://github.com/z-shell/any-gem)

  </TabItem>
  <TabItem value="node" label="Node modules">

Install [Node modules](https://www.npmjs.com):

[Annex Bin-Gem-Node](https://github.com/z-shell/zi/wiki/z-a-bin-gem-node) | [Package Any Node](https://github.com/z-shell/any-node)

  </TabItem>
  <TabItem value="rust" label="Rust packages">

Install [Rust packages](https://crates.io):

[Annex Rust](https://github.com/z-shell/zi/wiki/z-a-rust)

  </TabItem>
  <TabItem value="github" label="GitHub" default>

Install almost everything from [GitHub](https://github.com):

[Annexes](https://github.com/z-shell/zi/wiki/Annexes) | [Packages](https://github.com/z-shell/zi/wiki/Packages) | [Annex Meta Plugins](https://github.com/z-shell/zi/wiki/z-a-meta-plugins) | [Gallery of Invocations](https://github.com/z-shell/zi/wiki/Gallery)

</TabItem>
</Tabs>

---

- The dedicated [packages](https://github.com/z-shell/zi/wiki/Packages/) that offload the user from providing long and complex commands. See the [Z-Shell ZI](https://github.com/z-shell) organization for a complete list of packages.

- The specialized extensions — called [annexes](https://github.com/z-shell/zi/wiki/Annexes/) — allow to extend the plugin manager with new commands, URL-preprocessors (used by e.g.: [z-a-readurl](https://github.com/z-shell/z-a-readurl) annex), post-install and post-update hooks and much more.

- The system does not use `$FPATH`, loading multiple plugins don't clutter `$FPATH` with the same number of entries (e.g. `10`, `15` or more). Code is immune to `KSH_ARRAYS` and other options typically causing compatibility problems.

- Provides [reports and statistics](https://github.com/z-shell/zi/wiki/Commands#reports-and-statistics) about the plugins, such as describing what **aliases**, **functions**, **bindkeys**, **Zle widgets**, **zstyles**, [completions](https://github.com/z-shell/zi/wiki/Introduction#completion-management), variables, `PATH` and `FPATH` elements a plugin has set up. Allows to quickly [familiarize](https://github.com/z-shell/zi/wiki/Profiling-plugins) oneself with a new plugin and provides rich and easy-to-digest information that might be helpful on various occasions. supports the unloading of plugins and the ability to list, (un)install, and **selectively disable**, **enable** plugin's completions.

- Test configurations with docker at [playground](https://github.com/z-shell/playground)

---

[![asciicast](https://asciinema.org/a/QcC3gmoOqIkMdPJ7J9v6hiWGf.svg)](https://asciinema.org/a/QcC3gmoOqIkMdPJ7J9v6hiWGf)
