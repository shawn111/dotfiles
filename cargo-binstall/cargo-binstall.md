# cargo-binstall

It's a cargo plugins provide the easy way to install rust binaries.
In my dotfiles config, rotz would rely on cargo-binstall to install.


## Installation step for non-Rust users

Quick way
You can refer my [install.sh](https://github.com/shawn111/dotfiles/edit/main/cargo-binstall/install.sh)

```
curl https://raw.githubusercontent.com/shawn111/dotfiles/main/cargo-binstall/install.sh | sh
```

Detail way
- download cargo-binstall from github release https://github.com/cargo-bins/cargo-binstall/releases
- put cargo-binstall into your path, like ~/bin

## Usage

```
$ cargo-binstall mdbook # without cargo for non-Rust users
or
$ cargo binstall mdbook # with cargo
```


## GitHub Actions

It's amazing convenience and quick.
My current gh-pages build/reploy with cargo-binstall only 37s.
https://github.com/shawn111/dotfiles/actions/runs/7949076309

More information, https://github.com/marketplace/actions/install-development-tools

current config: https://github.com/shawn111/dotfiles/blob/main/.github/workflows/gh-pages.yml

```
jobs:
  build:
    ...
    steps:
      ...
      - name: Prepare cargo-binstall
        uses: cargo-bins/cargo-binstall@main
      - name: Install mdbook
        run: cargo binstall -y mdbook mdbook-presentation-preprocessor
      - name: Build mdBook
        run: mdbook build

```
