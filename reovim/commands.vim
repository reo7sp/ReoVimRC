command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')


function! s:google(query)
  call xolox#misc#open#url('https://google.com/search?q=' . a:query)
endfunction

command! -nargs=1 Google call s:google(<f-args>)


function! s:plugsearch(query)
  call s:google('vim ' . a:query . ' site:github.com')
endfunction

command! -nargs=1 PlugSearch call s:plugsearch(<f-args>)


function! s:plugadd(plugin)
  execute "!echo Plug \\'" . a:plugin . "\\' >> ~/.vimrc.user.install"

  call plug#begin(expand('~/.vim/bundle/'))
  source ~/.vimrc.user.install
  call plug#end()

  PlugInstall
endfunction

command! -nargs=1 PlugAdd call s:plugadd(<f-args>)
