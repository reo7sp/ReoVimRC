
""""""""""""""""""""""""""""""""""""""""""""""
"                                            "
" Author: Reo_SP (http://reo7sp.ru)          "
" Github: https://github.com/reo7sp/ReoVimRC "
"                                            "
""""""""""""""""""""""""""""""""""""""""""""""

" --- Init start {{{

if !1 | finish | endif

if has('vim_starting')
    set nocompatible
    set runtimepath=~/.vim,$VIMRUNTIME
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    filetype off
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" }}}

" --- Plugins {{{

" General
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 	'build': {
\ 		'windows' : 'tools\\update-dll-mingw',
\ 		'cygwin' : 'make -f make_cygwin.mak',
\ 		'mac' : 'make -f make_mac.mak',
\ 		'linux' : 'make',
\ 		'unix' : 'gmake'
\ 	}
\ }
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-misc'

" Navigation
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rking/ag.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'tmhedberg/matchit'

" Editing
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'antoyo/vim-licenses'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'Raimondi/delimitMate'

" Appearance
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'mhinz/vim-startify'

" File types
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'derekwyatt/vim-sbt'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'genoma/vim-less'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'ekalinin/Dockerfile.vim'

" Other
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'sjl/clam.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'scrooloose/syntastic'

" User
if filereadable(expand("~/.vimrc.user.install"))
    source ~/.vimrc.user.install
endif

" }}}

" --- Init end {{{

call neobundle#end()

filetype plugin indent on
NeoBundleCheck
let mapleader = ","

" }}}

" --- Plugin settings {{{

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
imap <C-e> <Plug>(neosnippet_expand_or_jump)
smap <C-e> <Plug>(neosnippet_expand_or_jump)
xmap <C-e> <Plug>(neosnippet_expand_target)

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
noremap <leader>tc :NERDTreeClose<CR>

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
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
	exe 'NeoCompleteLock'
    endif
endfunction
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
	exe 'NeoCompleteUnlock'
    endif
endfunction

" rainbow
let g:rainbow_active = 1

" syntastic
let g:syntastic_check_on_open=1

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

" vim php namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

" vim session
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_command_aliases = 1

" startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 5

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
set ruler
set shortmess+=aIcT
set viewoptions=folds,options,cursor,unix,slash
set cul
set scrolloff=5
set sidescrolloff=5
set list
set listchars=tab:»\ ,trail:·,nbsp:·,precedes:<,extends:>
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
set foldlevelstart=99
set wrap
set linebreak
set breakindent
set formatoptions=1
set shiftwidth=4
set tabstop=4
set softtabstop=4

" gvim
set guioptions=
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
noremap <S-Insert> <C-r>+
noremap! <S-Insert> <C-r>+
noremap <f2> :w!<cr>
"noremap <f3> :w!<cr>:bp<cr>:bd #<cr>
set pastetoggle=<f3>
vnoremap < <gv
vnoremap > >gv
inoremap jk <ESC>
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]
vnoremap // y/<C-R>"<CR>
nnoremap <cr> :noh<cr><cr>
noremap <f4> :noh<cr>

" Buffers
noremap <f7> :enew<cr>
noremap <f8> :bprevious<cr>
noremap <f9> :bnext<cr>
noremap <f12> :bp<cr>:bd #<cr>
nnoremap <leader>w <C-w>v<C-w>l

" Other
noremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>rt :!ctags -R .<cr>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" }}}

" --- Auto groups {{{

augroup ftconf
    au!
    au FileType vim setlocal foldmethod=marker
augroup END

augroup restoreCursor
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
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

if filereadable(expand(".vimrc.local"))
	source .vimrc.local
endif

" }}}
