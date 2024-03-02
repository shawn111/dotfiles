#!/bin/bash

VER=1.6.3
rotz_VER=0.10.0

ARCH=$(arch)
SUFFIX=tgz
TAR_FUN=zxvf

URL=https://github.com/cargo-bins/cargo-binstall/releases/download/v${VER}/cargo-binstall-$ARCH-unknown-linux-musl.full.tgz
FN=$(basename $URL)
SFN=$(basename $FN $SUFFIX)

BIN_NAME=$(basename $(realpath $(dirname $0)))
if [ "$BIN_NAME" == "rotz" ]; then
   VER=$rotz_VER
fi

if [ "$($BIN_NAME -V || true)" == "*${VER}" ]; then
   echo "$BIN_NAME is installed"
   exit
fi

PATH=~/bin:$PATH

mkdir -p ~/bin ~/.cargo/bin

if [ "$(whereis cargo-binstall)" == "cargo-binstall:" ] ; then
   curl -k -L -O $URL
   tar ${TAR_FUN} $FN
   mv cargo-binstall ~/bin
fi

cargo-binstall -y cargo-binstall
cargo-binstall -y rotz
ln -f ~/.cargo/bin/cargo-binstall ~/bin/cargo-binstall 
ln -f ~/.cargo/bin/rotz ~/bin/rotz
