#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../..
tar -czvpf sensitive.tgz -C ~/ .ssh -C ~/ .config/mp -C ~ code/mp/.gitconfig
gpg --symmetric --cipher-algo aes256 -o sensitive.tgz.gpg sensitive.tgz
rm -rf sensitive.tgz
