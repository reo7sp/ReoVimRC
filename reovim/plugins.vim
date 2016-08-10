call plug#begin(expand('~/.vim/bundle/'))


" General
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'

" Navigation
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'

Plug 'Lokaltog/vim-easymotion'

if !g:reovimrc_light
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'majutsushi/tagbar'

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

Plug 'Raimondi/delimitMate'
Plug 'ciaranm/detectindent'
if !g:reovimrc_light
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ntpeters/vim-better-whitespace'

  Plug 'scrooloose/syntastic'
  Plug 'xolox/vim-easytags'
  Plug 'Chiel92/vim-autoformat'
endif

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
if !g:reovimrc_light
  Plug 'godlygeek/tabular'
endif

" Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'airblade/vim-gitgutter'
if !g:reovimrc_light
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

" File type specific
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'

Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'

Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'genoma/vim-less'
Plug 'wavded/vim-stylus'

" Other
Plug 'tpope/vim-unimpaired'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'thinca/vim-quickrun'

" User
if filereadable(expand("~/.vimrc.user.install"))
  source ~/.vimrc.user.install
endif


call plug#end()
