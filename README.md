# Xubuntu + Home manager setup

* Repo's dir must be named `os` and be placed in user's home.
* All scripts meant to be executed in `scripts` dir.
* Do not forget to change user's vars in home.nix.

## Installation

1. Install nix (see https://nixos.org/download/)
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

2. Restart shell

3. Install deps
```sh
sudo apt update
sudo apt install -y git
sudo apt install -y curl
```

4. Run installation script as target user
```sh
curl -fs https://raw.githubusercontent.com/tyasheliy/xubuntu/refs/heads/master/install.sh | bash
```

5. Set zsh as default shell
```sh
(cd ~/os/scripts && bash set_zsh.sh)
```

6. Reboot system

## TODO

* visual studio code home-manager integration (there are home options in docs)
* firefox config in the nix way
