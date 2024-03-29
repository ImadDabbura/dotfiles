set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'joshdick/onedark.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'psf/black'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ryanoasis/vim-devicons'

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

let mapleader = "\<Space>"

" Save file with control s
nnoremap <C-s> :w<CR>

" Wrap commits to 72
autocmd Filetype gitcommit setlocal spell textwidth=72

" Quit vim help with q
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Navigation between buffers
" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>

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

" Use `..` to go up one level when inspecting git objects
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
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Black configutation
let g:ale_fixers = {}
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79

" FZF
nnoremap <leader>h :History:<CR>
nnoremap <leader>s :History/<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gs :GFiles?<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8', 'pylint']

" packadd minpac
" call minpac#init()
" call minpac#add('tpope/vim-unimpaired')
" call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

nnoremap gX :silent :execute "!open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>
function! CountTILs()
        execute '%s/^- \[//n'
    endfunction
