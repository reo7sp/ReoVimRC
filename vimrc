
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
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'xolox/vim-session'

" Editing
NeoBundle 'Valloric/YouCompleteMe' ", {
	"\ 'build' : {
	"\		'others' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
	"\	},
	"\ }
NeoBundle 'ervandew/eclim' ", {
	"\ 'build' : {
	"\		'others' : 'ant',
	"\	},
	"\ }
"NeoBundle 'OmniSharp/omnisharp-vim'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'antoyo/vim-licenses'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'chrisbra/SudoEdit.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'godlygeek/tabular'
NeoBundle 'sjl/gundo.vim.git'
NeoBundle 'osyo-manga/vim-over'

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
"NeoBundle 'scrooloose/syntastic'

" User
if filereadable("~/.vimrc.user.install")
    source ~/.vimrc.user.install
endif

" }}}

" --- Neobundle end {{{

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}

" --- Plugin settings {{{

"" neo complcache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_tags_caching_limit_file_size = 9999999
"let g:neocomplcache_dictionary_filetype_lists = {
	"\ 'default' : '',
	"\ 'vimshell' : $HOME.'/.vimshell_hist',
	"\ 'scheme' : $HOME.'/.gosh_completions'
	"\ }

"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"let g:neocomplcache_same_filetype_lists = {}
"let g:neocomplcache_same_filetype_lists._ = '_'

"set omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"" neo snippets
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"imap <expr><CR> neosnippet#expandable_or_jumpable() ?
	"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"if has('conceal')
	"set conceallevel=2 concealcursor=i
"endif

" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
map gs :YcmCompleter GoTo<CR>
map <leader>yr :YcmCompleter ReloadSolution<CR>

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" airline
"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_sep = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
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
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
map <c-s> :CtrlPMixed<cr>
map <c-g> :CtrlPMRUFiles<cr>
map <leader>fu :CtrlPFunky<cr>
map <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>

" easy motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map s <Plug>(easymotion-s)
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

"function! Multiple_cursors_before()
	"if exists(':NeoCompleteLock')==2
		"exe 'NeoCompleteLock'
	"endif
"endfunction
"function! Multiple_cursors_after()
	"if exists(':NeoCompleteUnlock')==2
		"exe 'NeoCompleteUnlock'
	"endif
"endfunction

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>

" gundo
map <leader>u :GundoToggle<cr>

" rainbow
let g:rainbow_active = 1

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
set shiftwidth=4
set tabstop=4
set smarttab
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set completeopt=longest,menuone,preview
set splitright
set splitbelow
set undofile
set autoread

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
nnoremap <space> za
map <S-Insert> <C-r>+
map! <S-Insert> <C-r>+
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
map <f2> :w!<cr>
map <f3> :w!<cr>:bp<cr>:bd #<cr>
set pastetoggle=<f4>
vnoremap x "_x
vnoremap X "_X
vnoremap < <gv
vnoremap > >gv
inoremap jk <ESC>

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

autocmd BufEnter .vimrc setlocal foldmethod=marker
au FocusLost * :wa

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
