""" 
"""
" Author:  Shubham Oli <oli.shubham@gmail.com>
" Date:    11-Dec-2019
" Version: 0.3
"""
"""


syntax enable


"" 
"" 
"" VUNDLE: to manage plugins
""
""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()



"" 
"" 
"" Preferences
""
""
set nocompatible
set path+=**
set relativenumber
set nowrap
set backspace=indent,eol,start
set hlsearch
set history=500
set encoding=UTF-8
set background=dark
set t_Co=256   
set cursorline
set ruler
set undofile                                     " to undo after file is re-opened
set undodir=/tmp
set laststatus=2
set splitright                                   " Open new splits to the right
set splitbelow                        		 " Open new splits to the bottom
set lazyredraw                        		 " Reduce the redraw frequency
set ttyfast
set clipboard+=unnamed  			 " use the clipboards of vim and win
set noerrorbells novisualbell
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set showcmd
set lbr
set tw=500
set updatetime=100


" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/* 
set wildignore+=*/target/*
set wildignore+=*/build/*
set wildignore+=*.so 
set wildignore+=*.o 
set wildignore+=*.class
set wildignore+=*.swp 
set wildignore+=*.zip
set wildignore+=*.pdf
set wildignore+=*/node_modules/**/*
set wildignore+=*/bower_components/**/*
set wildignore+=*/dist/**/*                  
set wildignore+=*/vendor/**/*                    




filetype plugin on
filetype indent on




""
"" Autocommands
au FocusGained,BufEnter * checktime


" YML file
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mardown file
autocmd BufRead,BufNewFile *.md set filetype=markdown

let g:NERDTreeRespectWildIgnore = 1



" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'



" Auto pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'



" Key Mappings
let mapleader="/"
nmap <leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>a :NERDTreeToggle<cr>
nmap <Leader><Leader> <Plug>NERDCommenterToggle
vmap <Leader><Leader> <Plug>NERDCommenterToggle
nmap <Leader><space> :nohls<cr>
nnoremap <C-p> :Files<CR>
cmap Wq wq


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Colors
hi LineNr ctermfg=grey
hi CursorLine cterm=NONE ctermbg=8

