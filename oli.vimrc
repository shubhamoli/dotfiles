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
Plug 'ron89/thesaurus_query.vim'
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
Plug 'liuchengxu/vim-which-key'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'svelte', 'html'] }

call plug#end()



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
set clipboard=unnamed                   " use the clipboards of vim and win
set noerrorbells novisualbell
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set showcmd
set lbr
set tw=500
set updatetime=100
set cursorline
set hidden
" set diffopt+=vertical
set shiftwidth=4
set expandtab
set tabstop=4
set autoindent smartindent
"set background=dark
set nobackup                            " required by coc, turns of backing up in .swp files
set nowritebackup                       " required by coc
set backupdir=/tmp//                    " extra slash keeps fullpath of file to avoid
set directory=/tmp//                    " conflict between 2 file with same name but in different directory


set spell
set spelllang=en

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
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/dist/*
set wildignore+=*/vendor/*
set wildignore+=*/.git/*

set wildmode=list:longest,list:full


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

" Python files
autocmd BufWritePre *.py 0,$!yapf




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

" Ultisnip
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Key Mappings
let mapleader=","
let maplocalleader=","
nmap <leader>ev :edit $HOME/.vimrc<CR>
nnoremap <Leader>a :NERDTreeToggle<cr>
nnoremap <Leader>t :NERDTreeFind<cr>
nmap <Leader><Leader> <Plug>NERDCommenterToggle<cr>
vmap <Leader><Leader> <Plug>NERDCommenterToggle<cr>
nmap <Leader><space> :nohls<cr>
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Ag<CR>
cmap Wq wq


" which key
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <Space> :<c-u>WhichKey  '<Space>'<CR>

" Thesaurus query
let g:tq_map_keys = 0
let g:tq_truncation_on_syno_list_size = 200
nnoremap <Leader>qt :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>qt y:ThesaurusQueryReplace <C-r>"<CR>




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

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Normal mode in Terminal mode
tnoremap <Esc> <C-\><C-n>

" Prettier config
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0


" Insert mode ny default
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" Colors
"hi LineNr ctermfg=grey
"hi CursorLine   cterm=none ctermbg=237
"hi CursorLineNR   cterm=none ctermbg=237

"let g:NERDTreeHijackNetrw = 0
"let g:ranger_replace_netrw = 1
"let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

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
