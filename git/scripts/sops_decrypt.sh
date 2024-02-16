#!/bin/bash

#scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#cd "${scriptDir}/.." || exit 1

export SOPS_AGE_KEY_FILE=~/.config/git/age.key
exec 3<<< "$(cat $1)"
sops --decrypt --input-type json --output-type json /dev/fd/3
#sops --decrypt --input-type json --output-type json $1
