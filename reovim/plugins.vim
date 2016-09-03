call plug#begin(expand('~/.vim/bundle/'))


" General
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'

" Navigation
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neomru.vim'
Plug 'thinca/vim-unite-history'

Plug 'Lokaltog/vim-easymotion'

Plug 'vim-scripts/BufOnly.vim'
Plug 'simeji/winresizer'
if !g:reovimrc_light
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'majutsushi/tagbar'
  Plug 'xolox/vim-session'
endif

" Editing
if !g:reovimrc_light && has('nvim') && has('python3')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neco-syntax'

  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

  Plug 'zchee/deoplete-jedi'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'zchee/deoplete-go'
  Plug 'fishbullet/deoplete-ruby'

  Plug 'osyo-manga/vim-monster', { 'do': 'gem install rcodetools' }
else
  Plug 'vim-scripts/AutoComplPop'
endif

if !g:reovimrc_light
  Plug 'scrooloose/syntastic'
  Plug 'xolox/vim-easytags'
  Plug 'Chiel92/vim-autoformat'
  Plug '907th/vim-auto-save'
endif

Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/python_match.vim'
Plug 'vim-scripts/ruby-matchit'
Plug 'Raimondi/delimitMate'
Plug 'ciaranm/detectindent'
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'
Plug 'Shougo/context_filetype.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-endwise'
if !g:reovimrc_light
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'chrisbra/NrrwRgn'
endif

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'dyng/ctrlsf.vim'
if !g:reovimrc_light
  Plug 'rhysd/conflict-marker.vim'
  Plug 'mbbill/undotree'
  Plug 'mattn/gist-vim'
endif

" Appearance
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-gitgutter'
if !g:reovimrc_light
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

" File type specific
Plug 'reo7sp/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'

Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'genoma/vim-less'
Plug 'wavded/vim-stylus'

Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'

" Other
Plug 'tpope/vim-unimpaired'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

" User
if filereadable(expand("~/.vimrc.user.install"))
  source ~/.vimrc.user.install
endif


call plug#end()
