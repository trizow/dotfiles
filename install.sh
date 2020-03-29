#!/usr/bin/env bash
set -e
SCRIPTDIR=$(cd "$(dirname "$0")" || exit 1 ; pwd -P)
source "${SCRIPTDIR}/lib.sh"

#### Component Installs ####
install_apt
install_oh-my-zsh
install_p10k
install_gcloud
install_docker

#### Link .zshrc files ####
install_dotfiles

#### Post install ####
install_vim-plug
change_shell
