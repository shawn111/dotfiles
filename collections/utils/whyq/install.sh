#!/bin/bash

VER=0.10.1
ARCH=$(arch)
SUFFIX=tar.xz
TAR_FUN=Jxvf

URL=https://github.com/clux/whyq/releases/download/${VER}/yq-${ARCH}-unknown-linux-gnu.tar.xz
FN=$(basename $URL)
SFN=$(basename $FN $SUFFIX)

if [ "$(yq --version || true)" == "whyq ${VER}" ]; then
   echo "yq is installed"
   exit
fi

curl -k -L -O $URL
tar ${TAR_FUN} $FN

mv yq-${ARCH}-unknown-linux-gnu/yq ~/bin
rm -rf yq-${ARCH}-unknown-linux-gnu.tar.xz yq-aarch64-unknown-linux-gnu

