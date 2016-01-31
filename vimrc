
""""""""""""""""""""""""""""""""""""""""""""""
"                                            "
" Author: Reo_SP (http://reo7sp.ru)          "
" Github: https://github.com/reo7sp/ReoVimRC "
"                                            "
""""""""""""""""""""""""""""""""""""""""""""""

" --- Init start {{{

if !1 | finish | endif

set runtimepath=~/.vim,$VIMRUNTIME

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if !exists("g:reovimrc_light")
    let g:reovimrc_light = 0
endif

if filereadable(expand("~/.vimrc.user.before"))
	source ~/.vimrc.user.before
endif

if $REOVIMRC_NO_LIGHT
    let g:reovimrc_light = 0
endif
if $REOVIMRC_LIGHT
    let g:reovimrc_light = 1
endif

call plug#begin(expand('~/.vim/bundle/'))

" }}}

" --- Plugins {{{

" General
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'

" Navigation
Plug 'kien/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
if !g:reovimrc_light
    Plug 'tacahiroy/ctrlp-funky'
endif

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD'] }
if !g:reovimrc_light
	Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeCWD'] }
	Plug 'majutsushi/tagbar'
endif

Plug 'Lokaltog/vim-easymotion'

if !g:reovimrc_light
	Plug 'vim-scripts/restore_view.vim'
endif

Plug 'rking/ag.vim'
if !g:reovimrc_light
	Plug 'vim-scripts/a.vim', { 'for': ['cpp', 'c', 'h', 'hpp'] }
	Plug 'xolox/vim-session'
endif

" Editing
if g:reovimrc_light
	Plug 'ervandew/supertab'
else
	Plug 'Valloric/YouCompleteMe'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
endif

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
if !g:reovimrc_light
    Plug 'ntpeters/vim-better-whitespace'
endif

Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
if !g:reovimrc_light
	Plug 'tpope/vim-dispatch'
	Plug 'godlygeek/tabular'
	Plug 'antoyo/vim-licenses'
endif

" Appearance
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml', 'htm'] }

Plug 'bling/vim-airline'
if !g:reovimrc_light
	Plug 'airblade/vim-gitgutter'
endif

Plug 'mhinz/vim-startify'

" File type specific
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'genoma/vim-less'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'dag/vim-fish'

" Other
Plug 'tpope/vim-unimpaired'
Plug 'sjl/clam.vim'
if !g:reovimrc_light
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-fugitive'
endif

" User
if filereadable(expand("~/.vimrc.user.install"))
    source ~/.vimrc.user.install
endif

" }}}

" --- Init end {{{

call plug#end()

let mapleader = ","

" }}}

" --- Plugin settings {{{

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>yti :YcmCompleter GoToInclude<CR>
nnoremap <leader>ytd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ytf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ytt :YcmCompleter GoTo<CR>
nnoremap <leader>ytc :YcmCompleter GoToImprecise<CR>
nnoremap <leader>ytr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ytl :YcmCompleter GoToImplementation<CR>
nnoremap <leader>yte :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>ygt :YcmCompleter GetType<CR>
nnoremap <leader>ygp :YcmCompleter GetParent<CR>
nnoremap <leader>ygd :YcmCompleter GetDoc<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yss :YcmCompleter StartServer<CR>
nnoremap <leader>yst :YcmCompleter StopServer<CR>
nnoremap <leader>ysr :YcmCompleter RestartServer<CR>
nnoremap <leader>yrs :YcmCompleter ReloadSolution<CR>
nnoremap <leader>ysc :YcmCompleter ClearCompilationFlagCache<CR>

" ulti snips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-e>"

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
\ 	'__' : '-',
\ 	'n'  : 'N',
\ 	'i'  : 'I',
\ 	'R'  : 'R',
\ 	'c'  : 'C',
\ 	'v'  : 'V',
\ 	'V'  : 'V',
\ 	'' : 'V',
\ 	's'  : 'S',
\ 	'S'  : 'S',
\ 	'' : 'S',
\ }

" nerd tree
noremap <leader>tt :NERDTreeToggle<CR>
noremap <leader>tf :NERDTreeFind<CR>
noremap <leader>td :NERDTreeCWD<CR>

" tag bar
noremap <leader>g :TagbarToggle<CR>

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_extensions = ['funky', 'yankring', 'undo', 'cmdline', 'quickfix', 'menu']
noremap <c-g> :CtrlPFunky<cr>
noremap <c-p> :CtrlPMenu<cr>
if executable('git')
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

" easy motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <c-s> <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" multiple cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-h>'
let g:multi_cursor_skip_key='<C-j>'
let g:multi_cursor_quit_key='<Esc>'

" rainbow
let g:rainbow_active = 1

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wall '

" tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

" vim session
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_command_aliases = 1

" startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 5

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"

" }}}

" --- Vim preferences {{{

" Syntax
syntax enable
set t_vb=
set tm=500
set background=dark
if !has("gui_running")
	let g:gruvbox_italic=0
	set t_Co=256
	let g:rehash256=1
endif
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Editor appearance
set number
set relativenumber
set cul
set showmatch
set scrolloff=5
set sidescrolloff=5

set shiftwidth=4
set tabstop=4
set softtabstop=4

set list
set listchars=tab:»\ ,trail:·,nbsp:·,precedes:<,extends:>

set mat=2
set matchpairs+=<:>

set shortmess+=aIcT
set title
set confirm
set more
set laststatus=2
set ruler
set showmode
set showcmd

set foldenable
set foldmethod=syntax
set foldlevelstart=99

set wrap
set linebreak
set breakindent
set showbreak=+++\ 

" gvim
set guioptions=gi
set guiheadroom=0
set linespace=3

" Navigation
set incsearch
set hlsearch
set ignorecase
set smartcase

set magic
set gdefault

set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*~,*.pyc,.git/*,*.meta,.sync/*

set nostartofline

" Editing
set autoindent
set copyindent
set smartindent
set smarttab

set viewoptions=folds,cursor,unix,slash

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set completeopt=longest,menuone,preview
set splitright
set splitbelow

set undofile
set autoread
set autowriteall

" Other
set lazyredraw
set noerrorbells
set novisualbell
set mouse=a

set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set undodir=~/.vim/undo
set viewdir=~/.vim/view
set shell=bash

set history=700
set ttyfast
set hidden
set exrc
set secure

" }}}

" --- Keyboard shortcuts {{{

" Navigation
map 0 ^
nnoremap j gj
nnoremap k gk

" Editing
noremap <S-Insert> <C-r>+
noremap! <S-Insert> <C-r>+
set pastetoggle=<f3>

vnoremap < <gv
vnoremap > >gv

inoremap jk <ESC>
nnoremap <cr> :noh<cr><cr>
noremap <f4> :noh<cr>

" Buffers
nnoremap <leader>w <C-w>v<C-w>l
noremap <f2> :w!<cr>
noremap <f7> :enew<cr>
noremap <f8> :bprevious<cr>
noremap <f9> :bnext<cr>
noremap <f12> :bp<cr>:bd #<cr>

" Other
nnoremap <leader>ss :setlocal spell!<cr>

nnoremap <leader>rt :!ctags --fields=+l -R .<cr>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

noremap <F1> <ESC>

" }}}

" --- Auto groups {{{

augroup ftconf
    au!
    au FileType vim setlocal foldmethod=marker
augroup END

" }}}

" --- Language and charset {{{

" Encoding
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac

" Russian support
set keymap=russian-jcukenwin
set spelllang=ru_yo,en_us
set iskeyword=@,48-57,_,192-255
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set iminsert=0
set imsearch=0

" Other
set nospell

" }}}

" --- User vimrc {{{

if filereadable(expand("~/.vimrc.user.after"))
	source ~/.vimrc.user.after
endif

" }}}
