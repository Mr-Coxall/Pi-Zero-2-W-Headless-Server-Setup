#!/bin/bash

# you will need to change permissions on the file before you can run it
# chmod +x ./load.sh
# update and upgrade system
echo Update and upgrade system
sudo apt-get update -y
sudo apt-get dist-upgrade -y

# load git
sudo apt install -y git

# load ZRAM tools
sudo apt install -y zram-tools

# load NeoFetch
sudo apt install -y neofetch

# load .bashrc file and make it active
echo Load .bashrc file
> ~/.bashrc
cp ./.bashrc ~/.bashrc

# load some programs
echo Load programs
sudo apt-get -y install python3-pip

# load vim & .vimrc file
sudo apt install -y vim
echo Load .vimrc file
cp ./.vimrc ~/.vimrc

# load .gitconfig file
# echo Load .gitconfig file
cp ./.gitconfig ~/.gitconfig

# copy over shell script file
echo Load shell script files
mkdir ~/scripts
cp ./repo.sh ~/scripts/repo.sh
chmod +x ~/scripts/repo.sh
cp ./git-push.sh ~/scripts/git-push.sh
chmod +x ~/scripts/git-push.sh
cp ./java-lint.sh ~/scripts/java-lint.sh
chmod +x ~/scripts/java-lint.sh
cp ./main.yml ~/scripts/main.yml
cp ./swift.yml ~/scripts/swift.yml

# load YouCompleteMe
echo Load YouCompleteMe plugin for Vim
# need to do an upgrade to python libraries first
sudo pip3 install --upgrade requests
sudo apt install vim-youcompleteme -y
vim-addon-manager install youcompleteme


# load java programming software
echo load Java
sudo apt install default-jdk -y

# loading checkstyle for java
# https://github.com/checkstyle/checkstyle/releases
echo load CheckStyle for Java
wget https://github.com/checkstyle/checkstyle/releases/download/checkstyle-8.44/checkstyle-8.44-all.jar
cp ./checkstyle-8.44-all.jar ~/scripts/checkstyle.jar
wget https://raw.githubusercontent.com/Mr-Coxall/dot_files/main/mr-coxall_checks.xml
cp ./mr-coxall_checks.xml ~/scripts/


# you might need to get a newer version of swift
# https://swift.org/download/
echo load Swift
sudo apt-get install -y clang libblocksruntime0 libcurl4-openssl-dev -y
wget https://swift.org/builds/swift-5.5-release/ubuntu2004/swift-5.5-RELEASE/swift-5.5-RELEASE-ubuntu20.04.tar.gz
tar -zxvf swift-5.5-RELEASE-ubuntu20.04.tar.gz
sudo mkdir /usr/bin/swift
sudo cp -R ./swift-5.5-RELEASE-ubuntu20.04/usr/* /usr/bin/swift
echo "" >> ~/.bashrc
echo 'export PATH="${PATH}":/usr/bin/swift/bin' >> ~/.bashrc

# SwiftLint
# https://github.com/realm/SwiftLint/releases to get latest release
echo load SwiftLint for Swift
wget https://github.com/realm/SwiftLint/releases/download/0.44.0/swiftlint_linux.zip
unzip -n swiftlint_linux.zip
sudo mkdir /usr/bin/swiftlint
sudo cp ./swiftlint /usr/bin/swiftlint/
echo 'export PATH="${PATH}":/usr/bin/swiftlint' >> ~/.bashrc
echo "" >> ~/.bashrc

# Swift syntax highlighting for Vim
# Original Source: http://wingsquare.com/blog/swift-script-syntax-highlighting-and-indentation-for-vim-text-editor/
# Another helpful article: https://billyto.github.io/blog/swift-syntax-vim
# More about Vim packages: http://vimcasts.org/episodes/packages/
echo "--- creating ~/.vim/pack/bundle/start dir.."
mkdir -p ~/.vim/pack/bundle/start
echo "--- Cloning Apple's Swift repo.."
git clone --depth=1 https://github.com/apple/swift/
echo "--- Copying plugin to Vim bundles.."
cp -r ./swift/utils/vim ~/.vim/pack/bundle/start/swift
# echo "--- Cleaning up, removing swift repo.."
# rm -rf ./swift/

# python3 already installed
# install python linter
pip3 install black


# C++ already installed
# sudo apt install -y g++ - already installed on Pi
pip3 install cpplint


# Node.js update, it is installed
# you might need to upgrade tp newer version: https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
echo "Confirm NVM is loaded"
# you will want to update the .bash_profile, so the .bashrc automatically is executed
source ~/.bashrc
command -v nvm
nvm install node
npm install -g typescript
npm install -g ts-node
npm install prompt-sync # note: not global flag - does not work with it!
# install EsLint
# npm install -g eslint
# npm install -g eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin


# Mono Developement
echo load Mono Developement
sudo apt install -y mono-complete
# how to use: mono-csc helloWorld.cs;  mono helloWorld.exe


# load GitHub CLI
echo load GitHub CLI
GITHUB_CLI_VERSION=$(curl -s "https://api.github.com/repos/cli/cli/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo gh.deb "https://github.com/cli/cli/releases/latest/download/gh_${GITHUB_CLI_VERSION}_linux_armv6.deb"
sudo dpkg -i gh.deb

# provision GitHub
ssh-keygen -t ed25519 -C "mr.coxall@mths.ca"
eval "$(ssh-agent -s)"
# then copy public key over to GitHub SSH keys
cat ~/.ssh/id_ed25519.pub

# Vim YouCompleteMe plugin
# need some stuff first
# sudo apt install -y build-essential cmake vim-nox python3-dev
# get updated version of Clang
# https://solarianprogrammer.com/2018/04/22/raspberry-pi-raspbian-install-clang-compile-cpp-17-programs/
# wget http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-armv7a-linux-gnueabihf.tar.xz
# tar -xvf clang+llvm-9.0.0-armv7a-linux-gnueabihf.tar.xz
# rm clang+llvm-9.0.0-armv7a-linux-gnueabihf.tar.xz
# mv clang+llvm-9.0.0-armv7a-linux-gnueabihf clang_9.0.0
# sudo mv clang_9.0.0 /usr/local
# echo 'export PATH=/usr/local/clang_9.0.0/bin:$PATH' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=/usr/local/clang_9.0.0/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
# source ~/.bashrc
# clang++ --version
# install dev software, so you can use "all" tag
# apt install -y mono-complete golang
# https://vi.stackexchange.com/questions/13529/is-there-a-way-to-install-youcompleteme-plugin-using-vim-8-0-default-plugin-mana
# mkdir -p ~/.vim/pack/plugins/start
# git clone https://github.com/Valloric/YouCompleteMe ~/.vim/pack/plugins/start/YouCompleteMe
# cd ~/.vim/pack/plugins/start/YouCompleteMe && git submodule update --init --recursive && ./install.py --java-completer --ts-completer --clangd-completer



# then remove the dot_files directory 
# sudo rm -R ~/AWS-Ubuntu-Setup-Script

# reboot
echo ---
echo -- Rebooting Instance --
echo ---
sudo reboot now


# after reboot, need to run the following by hand

# provision GitHub
# then copy public key over to GitHub SSH keys
# cat ~/.ssh/id_ed25519.pub
# to test it out
ssh -T git@github.com

# configure GitHub CLI
gh auth login
# web method most likely the easiest
# use existing GitHub SSH keys
