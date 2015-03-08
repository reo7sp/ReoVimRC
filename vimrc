
""""""""""""""""""""""""""""""""""""""""""""""
"                                            "
" Author: Reo_SP (http://reo7sp.ru)          "
" Github: https://github.com/reo7sp/ReoVimRC "
"                                            "
""""""""""""""""""""""""""""""""""""""""""""""

" --- Neobundle start {{{

if !1 | finish | endif

if has('vim_starting')
	if &compatible
		set nocompatible
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle#install_process_timeout = 9999999

call neobundle#begin(expand('~/.vim/bundle/'))

" }}}

" --- Plugins {{{

" General
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\		'windows' : 'tools\\update-dll-mingw',
	\		'cygwin' : 'make -f make_cygwin.mak',
	\		'mac' : 'make -f make_mac.mak',
	\		'linux' : 'make',
	\		'unix' : 'gmake',
	\	},
	\ }
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-misc'

" Navigation
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'haya14busa/vim-asterisk'
NeoBundle 'boucherm/ShowMotion'

" Editing
NeoBundle 'Valloric/YouCompleteMe' ", {
	"\ 'build' : {
	"\		'others' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
	"\	},
	"\ }
NeoBundle 'ervandew/eclim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'antoyo/vim-licenses'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'godlygeek/tabular'
NeoBundle 'sjl/gundo.vim.git'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-eunuch'

" Appearance
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'oblitum/rainbow'
NeoBundle "myusuf3/numbers.vim"

" File types
NeoBundle 'groenewege/vim-less'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'fatih/vim-go'
NeoBundle 'spf13/vim-preview'

" Other
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'sjl/clam.vim'
NeoBundle 'tpope/vim-unimpaired'

" User
if filereadable(expand("~/.vimrc.user.install"))
    source ~/.vimrc.user.install
endif

" }}}

" --- Neobundle end {{{

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}

let mapleader = ","

" --- Plugin settings {{{

" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
map gs :YcmCompleter GoTo<CR>
map <leader>yr :YcmCompleter ReloadSolution<CR>

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n'  : 'N',
	\ 'i'  : 'I',
	\ 'R'  : 'R',
	\ 'c'  : 'C',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '' : 'S',
	\ }

" yank stack
map <leader>p <Plug>yankstack_substitute_older_paste
map <leader>P <Plug>yankstack_substitute_newer_paste

" ulti snips
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-e>"

" nerd tree
map <leader>t :NERDTreeToggle<CR>

" tag bar
map <leader>g :TagbarToggle<CR>

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_extensions = ['funky', 'yankring', 'undo', 'cmdline', 'quickfix', 'line', 'menu']
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
map <c-g> :CtrlPMRUFiles<cr>
map <leader>fu :CtrlPFunky<cr>
map <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

" easy motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <c-s> <Plug>(easymotion-s)
omap t <Plug>(easymotion-bd-tl)
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

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>

" gundo
map <leader>u :GundoToggle<cr>

" rainbow
let g:rainbow_active = 1

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

" vim asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" showmotion
nmap w <Plug>(show-motion-both-w)
nmap W <Plug>(show-motion-both-W)
nmap b <Plug>(show-motion-both-b)
nmap B <Plug>(show-motion-both-B)
nmap e <Plug>(show-motion-both-e)
nmap E <Plug>(show-motion-both-E)
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap ; <Plug>(show-motion-;)
"nmap , <Plug>(show-motion-,)

" ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" }}}

" --- Vim preferences {{{

" Syntax
syntax on
set t_vb=
set tm=500
if !has("gui_running")
	let g:gruvbox_italic=0
	set t_Co=256
	let g:rehash256=1
endif
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Editor appearance
set number
set ruler
set shortmess+=aIcT
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set cul
set scrolloff=5
set sidescrolloff=5
set list
set listchars=tab:»\ ,trail:·,nbsp:·,precedes:<,extends:>
set nowrap
set showmode
set showcmd
set showmatch
set mat=2
set matchpairs+=<:>
set confirm
set title
set more
set laststatus=2
set foldenable
set foldmethod=syntax
set foldlevelstart=7
set wrap

" gvim
set guioptions=

" Navigation
set incsearch
set ignorecase
set smartcase
set magic
set gdefault
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,.git/*,*.meta,.sync/*
set nostartofline

" Editing
set autoindent
set copyindent
set smartindent
set smarttab
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set completeopt=longest,menuone,preview
set splitright
set splitbelow
set undofile
set shiftwidth=4
set tabstop=4
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
set shell=bash
set history=700
set ttyfast
set hidden

" }}}

" --- Keyboard shortcuts {{{

" Navigation
map 0 ^
nnoremap j gj
nnoremap k gk

" Editing
nnoremap gV `[v`]
map <S-Insert> <C-r>+
map! <S-Insert> <C-r>+
map <f2> :w!<cr>
map <f3> :w!<cr>:bp<cr>:bd #<cr>
set pastetoggle=<f4>
vnoremap < <gv
vnoremap > >gv
inoremap jk <ESC>
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
vnoremap // y/<C-R>"<CR>

" Buffers
map <f5> :enew<cr>
map <f8> :bprevious<cr>
map <f9> :bnext<cr>
map <f12> :bp<cr>:bd #<cr>
nnoremap <leader>w <C-w>v<C-w>l

" Other
map <leader>ss :setlocal spell!<cr>
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" }}}

" --- Custom actions {{{

au BufEnter .vimrc setlocal foldmethod=marker

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

if filereadable(expand(".vimrc.local"))
	source .vimrc.local
endif

" }}}
