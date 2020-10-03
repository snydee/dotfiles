"source $HOME/src/dotfiles/vim/coc.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" nice defaults""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set tabstop=4 softtabstop=4
set colorcolumn=130
set smartindent
set shiftwidth=4  " number of spaces to use for auto indent
set autoindent  " copy indent from current line when starting a new
set incsearch
set noswapfile
set expandtab
set background=dark
set relativenumber
set hlsearch
set clipboard=unnamed
set path+=**
set t_Co=256 "needed for vim-airline
set mouse=a
set updatetime=100 " for updating vim git gutter faster
set cursorline "highlight cursor line
set backspace=2 "to allow backspacing over indent,eol,start


let os = system('uname -m') 


"plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

" -------------- PLUGIN SECTION BEGINS HERE ----------------

call plug#begin('~/.vim/bundle')
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine' "Display indent level
Plug 'fcpg/vim-osc52'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
"Uncomment below as needed
"Plug 'scrooloose/syntastic'
"Plug 'nvie/vim-flake8'
"Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim'
"install ctags separately
Plug  'preservim/tagbar'
if os =~ "armv6l"
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
else
    "Plug 'ycm-core/YouCompleteMe'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    Plug 'xuyuanp/nerdtree-git-plugin' "git indicators in Nerd Tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif
call plug#end()


if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" key remaps """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>rc :%s///gc<Left><Left><Left>
nmap <leader><leader> V
" F10 to toggle paste mode
nmap <F10> :set invpaste<CR>
set pastetoggle=<F10>


nnoremap :pli :PlugInstall<CR> 
nnoremap :plc :PlugClean<CR>
map <leader>t :TagbarToggle<CR>
map <TAB> gt 

"Disable cursor keys"
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'vnoremap' key '<Nop>'
  "exec 'inoremap' key '<Nop>'
  "exec 'cnoremap' key '<Nop>'
endfor

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" lightline/airline options """""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode "hide vim default mode status"


"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" FZF Options """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

if os !~ "armv6l"
    set rtp+=~/.fzf
    nnoremap <silent> <C-f> :Files<CR>
    nnoremap // :BLines<cr>
    nnoremap \\ :Buffers<cr>
    nnoremap <C-p> :Rg<cr>
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
        map <leader>r :NERDTreeFind<cr>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" NETRW Settings """""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:netrw_banner = 0
        let g:netrw_liststyle = 3
        let g:netrw_browse_split = 4
        let g:netrw_altv = 1
        let g:netrw_winsize = 15
if os =~ "armv6l"
        augroup ProjectDrawer
          autocmd!
          autocmd VimEnter * :Vexplore
        augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" ALE Settings """""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" Terraform Settings """""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
"let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
