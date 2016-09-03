let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000

autocmd CompleteDone * pclose!

function g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

let g:jedi#completions_enabled = 0
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
