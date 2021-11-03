# Overview
This document is a guide to setting up solid a neovim editing experience with auto complete, fuzzy file finding, blazingly fast project wide searching and so much more!

If you're interested in the plug-in free config, look for the line in `init.vim` that says "Plugin configs start here" and delete everything below it.

# Instructions
1. Download nvim binary

    Run `curl -LO https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage && chmod u+x nvim.appimage`
    
    then add `alias vim=/path/to/nvim.appimage` to `~/.bashrc`
2. Create `~/.config/nvim/init.vim`
3. Download [vim-plug](https://github.com/junegunn/vim-plug)
    
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
       
    then open neovim and run `:PlugInstall`  
4. Install [fzf](https://github.com/junegunn/fzf#building-fzf)

    `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install`
5. Install [ripgrep](https://github.com/BurntSushi/ripgrep)
6. Download language servers and configure using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

