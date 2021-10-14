set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'joshdick/onedark.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'sheerun/vim-polyglot'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
runtime macros/matchit.vim   " Allow to jump between matching pairs of keywords

syntax on
set shortmess+=I
set number 
" set spell
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set smartcase
set incsearch
set noerrorbells visualbell t_vb=
set mouse+=a
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set wildmode=full
set hls
set history=200
set nrformats-=octal
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
let g:SimpylFold_docstring_preview=1
let python_highlight_all=1

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" These mapping are used to force me to not use arrows and use vim plugins
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

let mapleader = "\<Space>"

" Save file with control s
nnoremap <C-s> :w<CR>

" Wrap commits to 72
autocmd Filetype gitcommit setlocal spell textwidth=72

" Quit vim help with q
autocmd Filetype help nnoremap <buffer> q :q<CR>



" Navigation between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Navigate between lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap 0 g^
nnoremap $ g$
nnoremap ^ g0

" Split  navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Expansion of Active File Directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Fix the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Color schemes
if has('gui_running')
  " set background=dark
  colorscheme solarized
else
  colorscheme onedark
endif

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" fugitive commands
autocmd BufReadPost fugitive://* set bufhidden=delete

" Add branch status to buffer
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Use C-l to remove highlighting after search
nnoremap <silent> <C-l> :<C-u>nohlsearch <CR><C-l>

" Change grep to use `ack` when called
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Temp settings
""""""""""""""
" nnoremap <f5> :!ctags -R<CR> # use f5 to trigger reindexing codebase
" autocmd BufWritePost * call system("ctags -R") # reindex everytime we save changes to a file
