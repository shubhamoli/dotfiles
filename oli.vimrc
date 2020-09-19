""
"""
" Author:  Shubham Oli <oli.shubham@gmail.com>
" Date:    11-Dec-2019
" Version: 0.3
"""
"""


""
""
"" VIM-PLUG: to manage plugins
""
""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yggdroot/indentline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'metakirby5/codi.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'hashivim/vim-terraform'

call plug#end()


""
"
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
set ruler
set undofile                         	" to undo after file is re-opened
set undodir=/tmp
set laststatus=2
set splitright                          " Open new splits to the right
set splitbelow                 		    " Open new splits to the bottom
set lazyredraw                        	" Reduce the redraw frequency
set ttyfast
set clipboard=unnamedplus  		        " use the clipboards of vim and win
set noerrorbells novisualbell
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set showcmd
set lbr
set tw=500
set updatetime=100
set cursorline
set hidden
set diffopt+=vertical
set shiftwidth=4
set expandtab
set tabstop=4
set autoindent smartindent
set background=dark
set nobackup                            " required by coc, turns of backing up in .swp files
set nowritebackup                       " required by coc
set backupdir=/tmp/backup//             " extra slash keeps fullpath of file to avoid
set directory=/tmp/swp//                " conflict between 2 file with same name but in different directory



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



syntax enable
syntax on
filetype plugin on
filetype indent on
set encoding=UTF-8
set t_Co=256



""
""
"" Autocommands
""
""
au FocusGained,BufEnter * checktime


" YML file
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mardown file
autocmd BufRead,BufNewFile *.md set filetype=markdown | setlocal textwidth=80

" Go lang
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" For Executing CLI from vim buffer
command! Execit set splitright | vnew | set filetype=sh | read !sh #




""
""
"" Global settings
""
""

" Nerdtree
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^node_modules$', '\.pyc', '^vendor$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''


" Auto pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" CoC keybindings
source ~/.coc.vim


" indentiline char
let g:indentLine_char='⎸'


" disable conceal by indentLine
let g:indentLine_setConceal = 0


" Key Mappings
let mapleader=","
let maplocalleader=","
nmap <leader>ev :edit $HOME/.vimrc<CR>
nnoremap <Leader>a :NERDTreeToggle<cr>
nmap <Leader><Leader> <Plug>NERDCommenterToggle<cr>
vmap <Leader><Leader> <Plug>NERDCommenterToggle<cr>
nmap <Leader><space> :nohls<cr>
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Ag<CR>
cmap Wq wq


" which key
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <Space> :<c-u>WhichKey  '<Space>'<CR>


" Quicker window movement
" Edit: this will be handled by vim-tmux-navigator
"
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l


" Disable Arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>
noremap! <Up> <Nop>


" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Normal mode in Terminal mode
tnoremap <Esc> <C-\><C-n>


" Insert mode ny default
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" Colors
"hi LineNr ctermfg=grey
"hi CursorLine   cterm=none ctermbg=237
"hi CursorLineNR   cterm=none ctermbg=237


colorscheme gruvbox


" Transparent BG
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE


" terraform plugin setup
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Git-Gutter
"let g:gitgutter_override_sign_column_highlight = 0



"Load powerline
" set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
