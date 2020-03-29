#!/usr/bin/env bash
# Library of installers to use during installtion

# Script dir
function find_install_dir() {
    cd "$(dirname "$0")" || exit 1 ; pwd -P
}

# Log 
function start_log() {
    echo
    echo "#################"
    echo "Installing ${FUNCNAME[1]}" >&2
    echo "#################"
}

function end_log() {
    echo "#################"
    echo
}

# apt packages
function install_apt() {
    start_log
    sudo apt update
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg2 \
        golang \
        nodejs \
        npm  \
        software-properties-common \
        tilix \
        vim \
        zsh \
        zsh-autosuggestions

    end_log
}

#  Oh my Zsh
# [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
function install_oh-my-zsh() {
    start_log
    if [ ! -d "${HOME}/.oh-my-zsh" ]; then
        curl -Lo /tmp/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
        sh /tmp/install.sh --unattended
    else
        echo "oh my zsh already installed, skipping."
    fi
    end_log
}

# Powerline 10k 
function install_p10k() {
    start_log
    if [ ! -d "${HOME}/.oh-my-zsh/themes/powerlevel10k" ]; then
        zsh -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/themes/powerlevel10k"
        echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> "${HOME}/.zshrc"
    else
        echo "Powerlevel 10k already installed, skipping."
    fi
    end_log
}

# Vim Plug
# [Vim-plugin](https://vimawesome.com/)
function install_vim-plug() {
    start_log
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    vim --not-a-term +PlugInstall +qall
    end_log
}

# Gcloud
# [gcloud](https://cloud.google.com/sdk/docs/downloads-apt-get)
function install_gcloud() {
    start_log
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update
    sudo apt-get -y install google-cloud-sdk
    end_log
}

# Docker
# [Docker](https://docs.docker.com/install/linux/docker-ce/debian/)
function install_docker() {
    start_log
    curl -fsSL "https://download.docker.com/linux/debian/gpg" | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs)  stable"

    sudo apt-get update
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io
    end_log
}

# dotfiles
function install_dotfiles() {
    start_log
    for i in .zshrc .vimrc vimrc; do 
        if [ -e "$HOME/$i" ]; then
            if [ ! -f "$HOME/$i-backup" ]; then
                echo "Backup of previous $i"
                mv "$HOME/$i" "$HOME/$i-backup"
            fi
            echo "Linking $SCRIPTDIR/$i to $HOME"
            ln -sf "$SCRIPTDIR/$i" "$HOME/$i"
        else 
            echo "$i not found in $HOME, are you sure you have it installed?"
            echo "Linking $SCRIPTDIR/$i to $HOME"
            ln -sf "$SCRIPTDIR/$i" "$HOME/$i"

        fi
    done
    end_log
}

# Change Shell
function change_shell() {
    chsh -s /usr/bin/zsh
}
