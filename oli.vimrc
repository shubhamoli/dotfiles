""" 
"""
" Author: Shubham Oli <oli.shubham@gmail.com>
" Date:   11-Dec-2019
"""
"""


"" VUNDLE ""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Requires:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'hzchirs/vim-material'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'

" Requires:
" brew install the_silver_searcher
" 
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()




"" Preferences ""
set nocompatible
set showcmd
set nowrap
set backspace=indent,eol,start
set hlsearch
set history=500
set encoding=UTF-8
set background=dark
set t_Co=256   
set cursorline
set ruler
set undofile                            " to undo after file is re-opened
set undodir=/tmp
syntax enable

set so=10                                " lines to skip when moving vertically
set langmenu=en                         
set ruler
set cmdheight=1
set hid                                 " Hide abondoned buffer
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
set noswapfile
set ai
set autoread
set expandtab                           " Use spaces for tabs
set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set updatetime=100                      " Update time for a change

filetype plugin on
filetype indent on

au FocusGained,BufEnter * checktime

" for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


"" Color Scheme ""
let g:dracula_colorterm = 0 
let g:dracula_italic = 0
"colorscheme dracula

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

let mapleader="/"
nnoremap <Leader>a :NERDTreeToggle<cr>
nmap <Leader><Leader> <Plug>NERDCommenterToggle
vmap <Leader><Leader> <Plug>NERDCommenterToggle
nmap <Leader><space> :nohls<cr>
nnoremap <C-p> :Files<CR>
cmap Wq wq











