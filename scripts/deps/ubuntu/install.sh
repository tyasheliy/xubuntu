#!/bin/bash

# run as user in script's parent dir.

set +e

source ../shared/install_docker.sh
sudo -E bash ./install_nekoray.sh
