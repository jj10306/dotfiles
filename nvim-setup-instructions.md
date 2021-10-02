1. Download nvim binary
    a. curl -LO https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage
    b. chmod u+x nvim.appimage
    c. Add 
        alias vim=<path to nvim.appimage 
       to ~/.bashrc
2. Create ~/.config/nvim/init.vim
3. Download vim-plug (plug-in manager - https://github.com/junegunn/vim-plug)
    a. sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    b. Open vim and type :PlugInstall
4.Configure LSPs (https://github.com/neovim/nvim-lspconfig)
5. Install fzf binary (https://github.com/junegunn/fzf#building-fzf)
    a. git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
       ~/.fzf/install
6. Install ripgrep (https://github.com/BurntSushi/ripgrep)

