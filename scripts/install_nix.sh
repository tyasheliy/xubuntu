#!/bin/bash
set -e

sh <(curl -L https://nixos.org/nix/install) --daemon

set +e
mkdir -p $HOME/.config/nix
rm $HOME/.config/nix/nix.conf
ln -s $(realpath ./source/nix.conf) $HOME/.config/nix/
set -e
