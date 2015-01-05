
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

call neobundle#begin(expand('~/.vim/bundle/'))

" }}}

" --- Plugins {{{

" General
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\    },
	\ }
NeoBundle 'tpope/vim-repeat'
NeoBundle 'xolox/vim-misc'

" Navigation
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'xolox/vim-session'

" Editing
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'antoyo/vim-licenses'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'chrisbra/SudoEdit.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'vim-scripts/YankRing.vim'

" Appearance
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'morhetz/gruvbox'

" File types
NeoBundle 'groenewege/vim-less'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'

" Other
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/syntastic'

" }}}

" --- Neobundle end {{{

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}

" --- Plugin settings {{{

" neo complcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_tags_caching_limit_file_size = 9999999
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-e>  neocomplcache#cancel_popup()

let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" neo snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
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

" nerd tree
map <leader>t :NERDTreeToggle<CR>

" tag bar
map <leader>g :TagbarToggle<CR>

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>
map <c-m> :CtrlPMRUFiles<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" easy motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
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

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>

" syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" }}}

" --- Vim preferences {{{

" Syntax
syntax on
set t_vb=
set tm=500
set background=dark
set t_Co=256
let g:rehash256=1
if !has("gui_running")
	let g:gruvbox_italic=0
endif
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Editor appearance
set number
set ruler
set shortmess+=aIc
set cul
set scrolloff=5
set sidescrolloff=5
set list
set listchars=tab:»\ ,trail:·,nbsp:·,precedes:⋯,extends:⋯
set nowrap
set showmode
set showcmd
set showmatch
set mat=2
set matchpairs+=<:>
set guioptions=
set confirm
set title
set more
set laststatus=2
set foldenable
set foldmethod=syntax
set foldlevelstart=7

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

" Other
set lazyredraw
set noerrorbells
set novisualbell
set mouse=a
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set shell=bash
set history=700
set ttyfast
set hidden
set autoread

" }}}

" --- Keyboard shortcuts {{{

" General
let mapleader = ","
let g:mapleader = ","

" Navigation
map 0 ^
nnoremap j gj
nnoremap k gk

" Editing
set pastetoggle=<F2>
nnoremap gV `[v`]
nnoremap <space> za
map <S-Insert> <C-r>+
map! <S-Insert> <C-r>+
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
nmap <f3> :w!<cr>
nmap <f4> :w!<cr>:bp<cr>:bd #<cr>

" Buffers
nmap <f7> :enew<cr>
nmap <f9> :bprevious<cr>
nmap <f10> :bnext<cr>
nmap <f12> :bp<cr>:bd #<cr>

" Other
map <leader>ss :setlocal spell!<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" }}}

" --- Custom actions {{{

autocmd BufEnter *.tt2 setlocal filetype=tt2html
autocmd BufEnter .vimrc setlocal foldmethod=marker

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

source ~/.vimrc.user

" }}}
