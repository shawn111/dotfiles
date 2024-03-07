# My awesome Rust CLI collection

---
### Why Rust (from wg-cli)

[](https://www.rust-lang.org/what/cli)

<!--web-only-->

* Solid and quick
* Easy distribution
  - source and binary
  - cross platform
  - cargo binstall
  - github action
* Robust configuration
* Manuals? done.
* Data in, data out
  - talking to humans
  - talking to machines
* Flexible logging
<!--web-only-end-->


---
### Why rust-cli for me?
* a lot of resource
  - community
    - youtube / discord / zulipchat
* 80% of my daily cli apps are rust
* for learning rust

---

## wezterm: Terminal Emulator / Multiplexer

- cross platforms
- Multiplex terminal panes, tabs and windows with native mouse and scrollback
  - on local / remotes
- SSH client with native tabs
- Connect to serial ports for embedded/Arduino work
- Ligatures, Color Emoji and font fallback, with true color and dynamic color schemes.
  - https://github.com/tonsky/FiraCode#fira-code-monospaced-font-with-programming-ligatures
- Kitty graphics support
- Sixel graphics support

---
<!-- end_slide -->

https://wezfurlong.org/wezterm/features.html#available-features


### others: Alacritty
- light

---
<!-- end_slide -->


## zellij: Terminal Multiplexer

### pros:
- multi-layout: floating / stacked https://zellij.dev/news/stacked-panes-swap-layouts/
- wasm plugin: loading from web https://zellij.dev/news/session-resurrection-ui-components/
- zellij as IDE: https://zellij.dev/news/config-command-layouts/
- Multiple Cursors with colored: https://zellij.dev/news/multiplayer-sessions/
- Sixel Support: https://zellij.dev/news/sixel-search-statusbar/

### cons:
- too many hotkey

---
<!-- end_slide -->


## fish (SHELL)

- 3.x C++ + rust https://github.com/fish-shell/fish-shell/blob/master/doc_internal/fish-riir-plan.md

pros:
- autosuggestion, history default enable
- Web Interface for configuration: fish_config
- fish plugins: fisher
  - tide https://github.com/IlanCosman/tide
- light

cons:
- not POSIX compliance

others: nushell

---
<!-- end_slide -->

### starship: cross shell prompt
- Compatibility First: Use it everywhere!
  - powershell / zsh (Linux / MacOS / BSD / Windows)
- Customizable
  - Every little detail is customizable to your liking, to make this prompt as minimal or feature-rich as you'd like it to be.

- Advanced Support (depend shell functions) 
  - TransientPrompt
  - pre-prompt and pre-execution


---
<!-- end_slide -->

### atuin: Sync, search and backup shell history with Atuin

- global / dir / session scope
- End-to-end encryption
- Store extra context
  - working directory
  - exit code, and more!
- stats
  - atuin stats last friday

---
<!-- end_slide -->

## helix: Kakoune / Neovim like editor

### pros:
- Vim-like modal editing
- Multiple selections
- Built-in language server support
- Smart, incremental syntax highlighting and code editing via tree-sitter

### cons:
- lack plugins
  - An embeddable and extensible scheme dialect https://github.com/mattwparas/steel
  - wasm (been label won't fix)
- 

---
<!-- end_slide -->

## comtrya: dotfiles manager

- Configuration Management for Localhost
- Run on any operating system
- Provide a simple YAML interface to, potentially, complex tasks
  - file
  - command
  - package
  - service (not yet)

mydotfiles:
- with mdbook
- http://shawn111.github.io/dotfiles

### others: rotz
- focus on files (symlink / hardlink)
- with install function

---
<!-- end_slide -->

## cargo binstall / install: app manager?

- cargo-quickinstall
  - This will install pre-compiled versions of any binaries in the crate. If we don't have a pre-compiled version, it will fallback to cargo install automatically.
- cargo-binstall
  - Binary installation for rust projects
  - github action

---
<!-- end_slide -->

## presenterm (md / slide)

- Define your presentation in a single markdown file.
- Images and animated gifs on terminals like kitty, iterm2, and wezterm.
- Customizeable themes including colors, margins, layout (left/center aligned content), footer for every slide, etc. Several built-in themes can give your presentation the look you want without having to define your own.
- Code highlighting for a wide list of programming languages.
- Selective/dynamic code highlighting that only highlights portions of code at a time.
- Column layouts.
- LaTeX and typst formula rendering.
- Introduction slide that displays the presentation title and your name.
- Slide titles.
- Shell code execution.
- Export presentations to PDF.
- Pause portions of your slides.
- Custom key bindings.
- Automatically reload your presentation every time it changes for a fast development loop.

### mdcat
---
<!-- end_slide -->

## asciinema related / autocast

- asciinema
  - 2.x python -> rust
- agg (asciicast2gif)
- autocast
  - Automatically generate an asciicast file for use with asciinema.

Note:

Here's how to use Nerd Fonts with agg:

Download one of the patched font sets from https://github.com/ryanoasis/nerd-fonts/releases/latest , e.g. JetBrainsMono.zip
Unzip them into ~/.local/share/fonts (on Linux) or install with system font manager (macOS, Windows)

fc-cache -v -f
Specify font family like this:

agg --font-family "JetBrainsMono Nerd Font Mono" demo.cast demo.gif

---
<!-- end_slide -->

## tracing console


## tui-logger
https://github.com/gin66/tui-logger
- systemctl-tui

