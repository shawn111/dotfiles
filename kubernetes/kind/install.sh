BIN_PATH=~/bin
mkdir -p $BIN_PATH
[ $(uname -m) = x86_64 ] && curl -Lo $BIN_PATH/kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
[ $(uname -m) = aarch64 ] && curl -Lo $BIN_PATH/kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-arm64
chmod +x $BIN_PATH/kind
