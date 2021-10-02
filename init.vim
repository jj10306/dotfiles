let mapleader=" "
syntax on
set relativenumber
set backspace=indent,eol,start
set nohlsearch
set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set updatetime=50
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


imap jk <ESC>
nmap <leader>d dd

nmap <leader>w :w<CR> 
nmap <leader>q :q<CR>
nmap <leader>z :wq<CR>
nmap <leader>c :bd<CR>

nmap <leader>. :source<CR>
nmap <leader>vm :e $MYVIMRC<CR>
nmap <leader>br :e ~/.bashrc<CR>

map <C-k> :bnext<CR>
map <C-j> :bprev<CR>
map <C-l> <C-^>

set splitbelow ***
set splitright


" *** Plugin configs start here ***

 call plug#begin('~/.local/share/nvim/site')
 " Delicious colorscheme
 Plug 'morhetz/gruvbox'
 "" Collection of common configurations for the Nvim LSP client
 Plug 'neovim/nvim-lspconfig'
 "" Extensions to built-in LSP, for example, providing type inlay hints
 Plug 'nvim-lua/lsp_extensions.nvim'
 "" Autocompletion framework for built-in LSP
 Plug 'nvim-lua/completion-nvim'
 " Fuzzy finder
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 " Status/Tabline
 Plug 'vim-airline/vim-airline'
 " Git
 Plug 'tpope/vim-fugitive'
 call plug#end()


colorscheme gruvbox
set background=dark

"" https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
"" FZF
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>

" git fugitive
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua << EOF
 
 -- nvim_lsp object
 local nvim_lsp = require'lspconfig'
 
 -- function to attach completion when setting up lsp
 local on_attach = function(client)
     require'completion'.on_attach(client)
 end
 
 -- Enable rust_analyzer
 nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
 nvim_lsp.clangd.setup({ 
                          on_attach=on_attach 
                        })
 
 -- Enable diagnostics
 vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
     virtual_text = true,
     signs = true,
     update_in_insert = true,
   }
 )

EOF

" Code navigation shortcuts
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> rn    <cmd>lua vim.lsp.buf.rename()<CR>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" " Makes LSP errors pretty
 let g:gruvbox_contrast_dark = 'hard'
 if exists('+termguicolors')
     let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
     let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
 endif
 let g:gruvbox_invert_selection = '0'
 "
 " Set completeopt to have a better completion experience
 " :help completeopt
 " menuone: popup even when there's only one match
 " noinsert: Do not insert text until a selection is made
 " noselect: Do not select, force user to select one from the menu
 set completeopt=menuone,noinsert,noselect
 let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
 " Avoid showing extra messages when using completion
 set shortmess+=c
