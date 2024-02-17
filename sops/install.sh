#!/bin/bash -x

VER=3.8.1
ARCH=$(arch)
if [ "$ARCH" == "aarch64" ]; then
   ARCH=arm64
fi
if [ "$ARCH" == "x86_64" ]; then
   ARCH=amd64
fi

URL=https://github.com/getsops/sops/releases/download/v$VER/sops-v$VER.linux.$ARCH
FN=$(basename $URL)

if [[ "$(sops --version || true)" == "sops ${VER}"* ]]; then
   echo "sops is installed"
   exit
fi

curl -k -L -O $URL
mv $FN ~/bin/sops
chmod +x ~/bin/sops
