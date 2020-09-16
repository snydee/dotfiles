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
set clipboard=unnamed
set path+=**
set t_Co=256 " needed for vim-airline
set mouse=a
set updatetime=100 " for updating vim git gutter faster


let os = trim(system('uname -m')) 


" ------------- key remaps -----------

let mapleader = "\<Space>"

nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>rc :%s///gc<Left><Left><Left>
nmap <leader><leader> V

nnoremap <leader>plugi :PluginInstall<CR> 
nnoremap <leader>plugc :PluginClean<CR>


" -------------- VUNDLE SECTION BEGINS HERE ----------------
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
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
if os !~ "armv6l"
		Plugin 'ycm-core/YouCompleteMe'
		Plugin 'vim-airline/vim-airline'
		Plugin 'vim-airline/vim-airline-themes'
		Plugin 'junegunn/fzf'
		Plugin 'junegunn/fzf.vim'
        Plugin 'preservim/nerdtree'
        Plugin 'xuyuanp/nerdtree-git-plugin' "git indicators in Nerd Tree
        Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
else
        Plugin 'ctrlpvim/ctrlp.vim'
endif
Plugin 'Yggdroot/indentLine'
Plugin 'fcpg/vim-osc52'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" FZF Options """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

if os !~ "armv6l"
        set rtp+=~/.fzf
        nnoremap <silent> <C-f> :Files<CR>
        nnoremap // :BLines<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" Copy Text to System Clipboard """""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

xmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" vim-devicons """""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
autocmd FileType nerdtree setlocal nolist
let g:airline_powerline_fonts = 1

"get rid of [  ] around icons in NerdTree
if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" Nerd Tree Setting """"""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

if os !~ "armv6l"
        let NERDTreeShowHidden=1
        nmap <silent> <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
        autocmd StdinReadPre * let s:std_in=1
        "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" NERD COMMENTER """""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

"" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'


"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" VIM-GITGUTTER """""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ght :GitGutterLineHighlightsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" UNDOTREE """""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

"if has("persistent_undo")
"    set undodir=$HOME."/.undodir"
"    set undofile
"endif
