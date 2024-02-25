BIN_PATH=~/bin
OUTPUT=$BIN_PATH/kubectl
mkdir -p $BIN_PATH

[ $(uname -m) = x86_64 ] && curl -Lo $OUTPUT "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
[ $(uname -m) = aarch64 ] && curl -Lo $OUTPUT "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
chmod +x $OUTPUT


