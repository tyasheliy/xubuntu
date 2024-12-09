#!/bin/bash
set -e

sh <(curl -L https://nixos.org/nix/install) --daemon

set +e
mkdir -p $HOME/.config/nix
set -e

ln -s $(realpath ./source/nix.conf) $HOME/.config/nix/
