#!/bin/bash

VER=v0.4.37
ARCH=$(arch)
SUFFIX=tar.gz
TAR_FUN=zxvf

URL=https://github.com/rust-lang/mdBook/releases/download/$VER/mdbook-$VER-$ARCH-unknown-linux-musl.tar.gz
FN=$(basename $URL)
SFN=$(basename $FN $SUFFIX)

if [ "$(mdbook --version || true)" == "mdbook ${VER}" ]; then
   echo "mdbook is installed"
   exit
fi

curl -k -L -O $URL
tar ${TAR_FUN} $FN
mv mdbook ~/bin
rm -f $FN
