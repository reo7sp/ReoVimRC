# **Reo VimRC**

![Screenshot](http://i.imgur.com/XLWNhs9.png)

## How to install

    git clone https://github.com/reo7sp/ReoVimRC
    cd ReoVimRC
    ./install.sh


## How to update

    cd ReoVimRC
    git pull origin master
    ./install.sh


## How to add custom settings
For this purpose there is **~/.vimrc.user** file which you can edit as you want and changes won't be lost after this vimrc's update


## Plugins

### General
- [NeoBundle](https://github.com/Shougo/neobundle.vim) Great plugin manager
- [vimproc](https://github.com/Shougo/vimproc.vim) Advanced process execution
- [vim-repeat](https://github.com/tpope/vim-repeat) Dot command for plugins
- [vim-misc](https://github.com/xolox/vim-misc)

### Navigation
- [ctrlp.vim](https://github.com/kien/ctrlp.vim) File, buffer search
- [tagbar](https://github.com/majutsushi/tagbar) Tree structure of source file
- [nerdtree](https://github.com/scrooloose/nerdtree) File tree
- [a.vim](https://github.com/vim-scripts/a.vim) Fast switching between header and source files
- [vim-easymotion](https://github.com/Lokaltog/vim-easymotion) Awesome plugin for navigation
- [vim-abolish](https://github.com/tpope/vim-abolish)
- [grep.vim](https://github.com/vim-scripts/grep.vim) Grep in folder
- [vim-session](https://github.com/xolox/vim-session) Session manager

### Editing
- [vim-surround](https://github.com/tpope/vim-surround) Brackets fast editing
- [neocomplcache](https://github.com/Shougo/neocomplcache) Completions in vim
- [neosnippet.vim](https://github.com/Shougo/neosnippet.vim) Snippet engine
- [neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets) Snippet pack
- [vim-snippets](https://github.com/honza/vim-snippets) Snippet pack
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) Multiple cursors like in Sublime Text
- [closetag.vim](https://github.com/docunext/closetag.vim) Auto closes xml, html tags
- [emmet-vim](https://github.com/mattn/emmet-vim) Emmet
- [vim-licenses](https://github.com/antoyo/vim-licenses) Fast license notice adding
- [vim-expand-region](https://github.com/terryma/vim-expand-region) Allows to expand selection in visual mode
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter) Fast commenting
- [SudoEdit.vim](https://github.com/chrisbra/SudoEdit.vim) Saves or loads files under sudo
- [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace) Shows and fixes trailing whitespace
- [YankRing.vim](https://github.com/vim-scripts/YankRing.vim) Yank command manager

### Appearance
- [vim-airline](https://github.com/bling/vim-airline) Fancy status line
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) Shows changes between last commit in git and current file
- [MatchTag](https://github.com/gregsexton/MatchTag) Highlights xml, html tags
- [vim-smooth-scroll](https://github.com/terryma/vim-smooth-scroll) Enables smooth scrolling on ctrl+d and ctrl+u
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) Shows indent levels
- [gruvbox](https://github.com/morhetz/gruvbox) Color scheme

### File types
- [vim-less](https://github.com/groenewege/vim-less) \*.less
- [vim-perl](https://github.com/vim-perl/vim-perl) \*.tt
- [vim-scala](https://github.com/derekwyatt/vim-scala) \*.scala
- [scripts/nginx.vim](https://github.com/vim-scripts/nginx.vim) nginx config
- [vim-markdown](https://github.com/tpope/vim-markdown) \*.md
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) \*.coffee

### Other
- [vim-fugitive](https://github.com/tpope/vim-fugitive) Git manager
- [vimshell.vim](https://github.com/Shougo/vimshell.vim) Shell inside vim
- [syntastic](https://github.com/scrooloose/syntastic) Shows compilation errors


## Custom keyboard shortcuts

### Plugins
- Neocomplcache: **&lt;tab&gt;** selects next completion
- Neosnippets: **&lt;c-k&gt;** expands snippet
- Nerdtree: **&lt;leader&gt;t** toggles tree
- Tagbar: **&lt;leader&gt;g** toggles tree
- ctrlp: **&lt;c-f&gt;** opens file search, **&lt;c-b&gt;** opens buffer, **&lt;c-m&gt;** opens mru
- easymotion: **s** starts single character search in whole file, **&lt;leader-{l,j,k,h}&gt;** open single character search in specified direction
- multiple-cursors: **&lt;c-l&gt;** selects next occurence, **&lt;c-h&gt;** selects previous occurence, **&lt;c-j&gt;** skips occurence

### Vim
- **,** is a **&lt;leader&gt;** key
- **0** is **^**
- **j** is **gj**
- **k** is **gk**
- **&lt;f4&gt;** toggles paste mode
- **gV** selects text added in last insert mode
- **&lt;space&gt;** toggles fold
- **&lt;f2&gt;** saves buffer
- **&lt;f3&gt;** saves and closes buffer
- **&lt;f7&gt;** creates new buffer
- **&lt;f9&gt;** switches to previous buffer
- **&lt;f10&gt;** switches to next buffer
- **&lt;f12&gt;** closes buffer
- **&lt;leader&gt;ss** toggles spell check
- **&lt;leader&gt;ev** opens vimrc
- **&lt;leader&gt;sv** applies vimrc
