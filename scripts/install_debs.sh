sudo dpkg --clear-selections
sudo dpkg --set-selections < $(realpath ./source/debs)
sudo apt-get dselect-upgrade
