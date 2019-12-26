""" 
"""
" Author: Shubham Oli <oli.shubham@gmail.com>
" Date:   11-Dec-2019
"""
"""


"" VUNDLE ""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'hzchirs/vim-material'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-fugitive'


""  All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required




"" Preferences ""
set nocompatible
set showcmd
set nowrap
set backspace=indent,eol,start
set hlsearch
set history=500
set encoding=UTF-8
set background=dark
let g:solarized_termtrans = 1
syntax enable

set so=5                                " lines to skip when moving vertically
set langmenu=en                         
set ruler
set cmdheight=1
set hid                                 " Hide abondoned buffer
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
set noswapfile
set ai

set expandtab                           " Use spaces for tabs
set shiftwidth=4
set tabstop=4

set lbr
set tw=500

filetype plugin on
filetype indent on

set autoread
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
colorscheme dracula

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

