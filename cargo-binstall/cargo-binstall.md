# cargo-binstall

It's a cargo plugins provide the easy way to install rust binaries.
In my dotfiles config, rotz would rely on cargo-binstall to install.


# For Develop to enable binstall with GitHub Actions


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
