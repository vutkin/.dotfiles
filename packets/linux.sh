#!/bin/bash

function install_python {
    pip3 install \
        thefuck \
        git+https://github.com/jeffkaufman/icdiff.git
}

function install_gem {
    gem install \
        colorls
}

function install_yarn {
    yarn global add @aweary/alder
}

function install_debian {
    wget -q -O- https://api.bintray.com/orgs/gopasspw/keys/gpg/public.key | sudo apt-key add -
    echo "deb https://dl.bintray.com/gopasspw/gopass trusty main" | sudo tee /etc/apt/sources.list.d/gopass.list
    apt update
    apt install -y \
        mc \
        silversearcher-ag \
        most \
        jq \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        ruby \
        ruby-dev \
        rng-tools \
        gnupg \
        gopass \
        peco \
        yarn \
        neovim \
        zsh
    wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd_7.2.0_amd64.deb
    wget https://github.com/sharkdp/bat/releases/download/v0.9.0/bat_0.9.0_amd64.deb
    dpkg -i fd_7.2.0_amd64.deb
    dpkg -i bat_0.9.0_amd64.deb
    rm bat_0.9.0_amd64.deb fd_7.2.0_amd64.deb
}

if apt --version &> /dev/null; then
    install_debian
fi
install_python
install_gem
install_yarn
chsh -s /bin/zsh
