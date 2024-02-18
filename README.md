# dotfiles with notes

2024 Shawn's whole new workflow

[![asciinema CLI
demo](https://asciinema.org/a/LKbr8pKvHGJoCNouNKWKe8PSL.svg)](https://asciinema.org/a/LKbr8pKvHGJoCNouNKWKe8PSL?autoplay=1)


## Why combind dotfiles with document

Write documents help me and maybe others, but I'm too lazy.
I thought combind two of them are convince for maintain.
Since I might the files across my machines, I could write them easier.

## files / env-configs for cross-machines

I had serial machines like classic laptop (thinkpad), detachable chromebook (asus cm3),
e-ink (boox note), samsung (DEX), pixel 7a, cloud-vm, dev-machine, mac ...

Although, most of them are linux and my major env is terminal but they are very different.

An easy way to configure or update all my terminal envs would help me a lots.


## Switch to whole new toolset

Rust related toolsets are so powerful, such as fish / zelllij / helix / wezterm.
However, switch from orignal work flows to setup lots of machines are quite painful.

## No just dotfiles

Likely, I found rotz to maintain my dotfiles.
Then I realized it is supur match with all drop-in sytles files.
I'm planning not just keep config file but also documents about howto use them.


## hacking

This repo is quite personal, if you have interesting about it.
Welcome to fork or tell me how to improve the quality.


This book is built by mdbook.

```
git clone git@github.com:shawn111/dotfiles.git

cd dotfiles

mdbook build
```

## rotz 

❯ rotz init
Created config file at /home/shawn/.config/rotz/config.yaml

Initializing repo in "/home/shawn/.dotfiles"

Initialized empty Git repository in /var/home/shawn/.dotfiles/.git/


## sops

git filter
https://devops.datenkollektiv.de/using-sops-with-age-and-git-like-a-pro.html

## exmaple
