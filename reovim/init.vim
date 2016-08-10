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

let mapleader = ","