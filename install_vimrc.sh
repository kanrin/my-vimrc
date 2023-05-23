#!/usr/bin/env bash
# Auth: Orz
#
# check file exist
if [ -f "$(dirname "$0")/vimrc" ]; then
    echo "Found vimrc file."

    # copy config file
	cp "$(dirname "$0")/vimrc" "$HOME/.vimrc"
    echo "Copied vimrc to $HOME/.vimrc."

    mkdir -p "$HOME/.vim/autoload"
    mkdir -p "$HOME/.vim/plugged"

    echo "Installing Vim-Plug..."
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Vim-Plug installed."
    echo "Setup completed."
else
    echo "Error: vimrc file not found."
fi

