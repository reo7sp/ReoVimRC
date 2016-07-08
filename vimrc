" --- Init start {{{

if !1 | finish | endif

set runtimepath=~/.vim,$VIMRUNTIME

if !exists("g:reovimrc_light")
  let g:reovimrc_light = 1
endif

if filereadable(expand("~/.vimrc.user.before"))
  source ~/.vimrc.user.before
endif

if !empty($REOVIMRC_LIGHT)
  let g:reovimrc_light = $REOVIMRC_LIGHT
endif

call plug#begin(expand('~/.vim/bundle/'))

" }}}

" --- Plugins {{{

" General
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'

" Navigation
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'

Plug 'Lokaltog/vim-easymotion'

if !g:reovimrc_light
  Plug 'xolox/vim-session'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'majutsushi/tagbar'
endif

" Editing
if g:reovimrc_light
  Plug 'ervandew/supertab'
else
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'tpope/vim-rails'
endif

Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
if !g:reovimrc_light
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'scrooloose/syntastic'
  Plug 'Chiel92/vim-autoformat'
  Plug 'xolox/vim-easytags'
endif

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
if !g:reovimrc_light
  Plug 'godlygeek/tabular'
endif

" Appearance
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'ciaranm/detectindent'
Plug 'tpope/vim-vinegar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pbrisbin/vim-mkdir'

Plug 'airblade/vim-gitgutter'
if !g:reovimrc_light
  Plug 'bling/vim-airline'
endif

" File type specific
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'

Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'

Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'genoma/vim-less'
Plug 'wavded/vim-stylus'

" Other
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

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
nnoremap <leader>ygn :YcmCompleter GoToInclude<CR>
nnoremap <leader>ygd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ygt :YcmCompleter GoTo<CR>
nnoremap <leader>ygc :YcmCompleter GoToImprecise<CR>
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ygi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>ygg :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yat :YcmCompleter GetType<CR>
nnoremap <leader>yap :YcmCompleter GetParent<CR>
nnoremap <leader>yad :YcmCompleter GetDoc<CR>
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yrs :YcmCompleter ReloadSolution<CR>

" ulti snips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-j>"

" unite
if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
elseif executable('ack')
  let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']
endif
nnoremap <c-p> :Unite -start-insert file_rec/async<cr>
nnoremap <c-t> :Unite -start-insert outline<cr>
nnoremap <c-u> :Unite -quick-match buffer window<cr>
nnoremap <c-\> :Unite -start-insert mapping command<cr>
nnoremap <leader>\ :Unite -start-insert<cr>

" easy motion
let g:EasyMotion_startofline = 0
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap <space> <Plug>(easymotion-s)
noremap <Leader>l <Plug>(easymotion-lineforward)
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)
noremap <Leader>h <Plug>(easymotion-linebackward)

" multiple cursors
let g:multi_cursor_use_default_mapping = 0
noremap <c-d> <nop>
noremap <c-u> <nop>
let g:multi_cursor_prev_key='<C-u>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-j>'
let g:multi_cursor_quit_key='<Esc>'

" rainbow
let g:rainbow_active = 1

" vim session
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_command_aliases = 1

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" gitgutter
let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" easytags
let g:easytags_async = 1
let g:easytags_suppress_ctags_warning = 1
let g:easytags_suppress_report = 1

" airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_mode_map = {
  \   '__' : '-',
  \   'n'  : 'N',
  \   'i'  : 'I',
  \   'R'  : 'R',
  \   'c'  : 'C',
  \   'v'  : 'V',
  \   'V'  : 'V',
  \   's'  : 'S',
  \   'S'  : 'S',
  \ }

" nerdtree
nnoremap <leader>p :NERDTreeToggle<CR>

" tagbar
nnoremap <leader>t :TagbarToggle<CR>

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1

" DetectIndent
autocmd BufReadPost * :DetectIndent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

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

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set list
set listchars=tab:»\ ,trail:·,nbsp:·,precedes:<,extends:>

set mat=2

set shortmess+=aIcT
set title
set confirm
set more
set ruler
set showmode
set showcmd
if g:reovimrc_light
  set laststatus=1
else
  set laststatus=2
endif

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

set modeline
set modelines=5

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

" }}}

" --- Keyboard shortcuts {{{

" Navigation
map 0 ^
nnoremap j gj
nnoremap k gk

" Editing
noremap <S-Insert> <C-r>+
noremap! <S-Insert> <C-r>+
set pastetoggle=<c-e>

vnoremap < <gv
vnoremap > >gv

inoremap jk <ESC>
nnoremap <cr> :noh<cr><cr>

" Buffers
nnoremap <c-k> :bprevious<cr>
nnoremap <c-l> :bnext<cr>
nnoremap <c-q> :bp<cr>:bd #<cr>
nnoremap <c-n> :enew<cr>
nnoremap <c-y> :e #<cr>
nnoremap <c-s> :wa<cr>
inoremap <c-s> <c-o>:wa<cr>
vnoremap <c-s> <esc>:wa<cr>gv

" Other
nnoremap <leader>ss :setlocal spell!<cr>

nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vs :so $MYVIMRC<cr>

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
