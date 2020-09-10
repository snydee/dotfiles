syntax on
set nu
set tabstop=4 softtabstop=4
set colorcolumn=80
set smartindent
set incsearch
set noswapfile
set expandtab
set background=dark
set relativenumber
set hlsearch

let mapleader = "\<Space>"

nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

nmap <silent> <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set clipboard=unnamed
set path+=**

" VUNDLE SECTION BEGINS HERE 
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'preservim/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fcpg/vim-osc52'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set t_Co=256
set mouse=a

" FZF Options
set rtp+=~/.fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap // :BLines<cr>

" Copy Text to System Clipboard
xmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>

