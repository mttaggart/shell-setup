set nu
set wrap linebreak nolist
set clipboard=unnamedplus
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set encoding=utf-8

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'flazz/vim-colorschemes'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'raimondi/delimitmate'

Plug 'jparise/vim-graphql'

Plug 'jayli/vim-easycomplete'

Plug 'SirVer/ultisnips'

Plug 'chesleytan/wordcount.vim'

Plug 'pangloss/vim-javascript'

Plug 'scrooloose/syntastic'

Plug 'airblade/vim-gitgutter'

Plug 'zah/nim.vim'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'kannokanno/previm'

Plug 'reedes/vim-pencil'

Plug 'scrooloose/nerdcommenter'

Plug 'vim-scripts/fountain.vim'

Plug 'vim-scripts/fountainflow.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
" Initialize plugin system
call plug#end()

" Previm command for Mac
" let g:previm_open_cmd = 'open -a Google Chrome'

" Previm command for Linux 
let g:previm_open_cmd = '/usr/bin/vivaldi'


" Color Scheme
" colorscheme nightsky
colorscheme dracula
