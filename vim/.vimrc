"if filereadable("source $HOME/dotfiles/vim/.coc.vim")
    source $HOME/.coc.vim
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" nice defaults""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set tabstop=4 softtabstop=4
set colorcolumn=119
set smartindent
set shiftwidth=4  " number of spaces to use for auto indent
set autoindent  " copy indent from current line when starting a new
" start searching immediateky and highlight search results
set incsearch hlsearch
" ignore case in search unless uppercase is present in search
set ignorecase smartcase
set noswapfile
set expandtab
set relativenumber
set clipboard=unnamed
set path+=**
set t_Co=256 "needed for vim-airline
set mouse=a
set updatetime=100 " for updating vim git gutter faster
set cursorline "highlight cursor line
set backspace=2 "to allow backspacing over indent,eol,start
set laststatus=2
"Reload file automatically if its modified on disk
 au CursorHold * checktime 
" Update a buffer's contents on focus if it changed outside of Vim.
 au FocusGained,BufEnter * :checktime
set autoread


" split right or below only
set splitbelow
set splitright

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
Plug 'wadackel/vim-dogrun'
"Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring  = 0
"Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine' "Display indent level
Plug 'fcpg/vim-osc52'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
"Uncomment below as needed
"Plug 'scrooloose/syntastic'
"Plug 'nvie/vim-flake8'
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim'
"install ctags separately
Plug  'preservim/tagbar'
" Atom One Dark / Light theme.
Plug 'rakr/vim-one'
" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'
"Plug 'wellle/context.vim'
Plug 'vim-test/vim-test'
Plug 'jebaum/vim-tmuxify'
if os =~ "armv6l"
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'itchyny/lightline.vim'
else
    "Plug 'ycm-core/YouCompleteMe'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
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
"""""""""""""" Color Schemes """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme dogrun
 colorscheme one
hi Pmenu ctermbg=black ctermfg=white
hi Search ctermbg=Yellow
"hi Search cterm=NONE ctermfg=black ctermbg=blue
hi CursorLine   cterm=NONE ctermbg=DarkGrey ctermfg=white guibg=darkred guifg=white
set background=dark



"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" key remaps """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"
nnoremap jk <ESC>:w<CR>
nnoremap kj <ESC>:w<CR>
inoremap jk <ESC>:w<CR>
inoremap kj <ESC>:w<CR>
vnoremap jk <ESC>:w<CR>
vnoremap kj <ESC>:w<CR>

" for wrapped  lines, scroll the wrapped lines
nnoremap j gj
nnoremap k gk

" Toggle last open buffer
nnoremap <leader><tab> <c-^>


nnoremap <leader>rv :source $MYVIMRC<CR>
" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>


nmap <leader><leader> V
" F10 to toggle paste mode
nmap <F10> :set invpaste<CR>
set pastetoggle=<F10>
nmap <F2> :q!<CR>
nmap <F3> :set relativenumber!<CR>

nnoremap <leader>pli :PlugInstall<CR> 
nnoremap <leader>plc :PlugClean<CR>
map <leader>t :TagbarToggle<CR>
"map <TAB> gt 
"Open file under cursor in vertical split, noremap prevents a recursive call, otherwise gf will loop forever
noremap gf <C-w>vgf<CR>

"Disable cursor keys"
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'vnoremap' key '<Nop>'
  "exec 'inoremap' key '<Nop>'
  "exec 'cnoremap' key '<Nop>'
endfor

" Clear search
 nnoremap <BS> :noh<CR>

" SAVE WITHOUT QUITTING
nnoremap <leader>z <Esc>:w<CR>
inoremap <leader>z <Esc>:w<CR>
" SAVE AND QUIT CURRENT BUFFER
inoremap <leader>wq <esc>:wq<cr>
nnoremap <leader>wq :wq<cr>

" QUIT DONT SAVE
inoremap <leader>qq <esc>:q!<cr>
nnoremap <leader>qq :q!<cr>
" QUIT ALL DONT SAVE
inoremap <leader>qa <esc>:qa!<cr>
nnoremap <leader>qa :qa!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" lightline/airline options """""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode "hide vim default mode status"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }



"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" FZF Options """"""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

"command! -bang -nargs=* Rg
"            \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
"  \   fzf#vim#with_preview(), <bang>0)
if os !~ "armv6l"
    set rtp+=~/.fzf
    nnoremap <silent> <C-f> :Files<CR>
    "nnoremap // :BLines<cr>
" Open fzf search will last search prepopulated
    nnoremap // :BLines<cr><C-p>
" Open list of buffers
    "nnoremap \\ :Buffers<cr>
    nnoremap <leader>b :Buffers<cr>
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
let g:NERDTreeWinSize=50

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" NERD COMMENTER """""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

"" Align line-wise comment delimiters flush left instead of following code
" indentation
map <leader>/ <Plug>NERDCommenterToggle
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" VIM-GITGUTTER """""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ght :GitGutterLineHighlightsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" UNDOTREE """""""""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""

if has("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let undodir=target_path
    set undofile
endif

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
let g:ale_linters = {'python': ['pyls','flake8']}
let g:ale_fixers = {'*': [], 'python': ['black']}
"let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" Terraform Settings """""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
"let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1


"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""Tagbar"""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" Vim Diff Colors """""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

highlight DiffAdd    cterm=bold ctermfg=44 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=7 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

let test#python#runner = 'pytest'
"let test#python#pytest#executable = '<placeholder>'
let test#strategy = "tmuxify"

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
 nmap <silent> tn :TestNearest<CR>
 nmap <silent> tf :TestFile<CR>
 nmap <silent> ts :TestSuite<CR>
 nmap <silent> tl :TestLast<CR>
 nmap <silent> tg :TestVisit<CR>

 " -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste


