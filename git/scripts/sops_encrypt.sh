#!/bin/bash -x
PUB_KEYFN=~/.config/git/age.pub

export SOPS_AGE_RECIPIENTS=$(<${PUB_KEYFN})
echo $1

exec 3<<< "$(cat $1)"
sops --encrypt --input-type json --output-type json --age ${SOPS_AGE_RECIPIENTS} --encrypted-regex "^(user|password)$" /dev/fd/3

#exec 3<<< "$(cat $1)"
#sops --encrypt --input-type json --output-type json --age ${SOPS_AGE_RECIPIENTS} --encrypted-regex "^(user|password)$" $1
