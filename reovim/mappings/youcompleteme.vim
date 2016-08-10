" main
nnoremap <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>yr :YcmCompleter RefactorRename 

nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yu :YcmCompleter GoToReferences<CR>

nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>

" GoTo*
nnoremap <leader>ytd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ytf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yti :YcmCompleter GoToImplementation<CR>
nnoremap <leader>yte :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap <leader>yth :YcmCompleter GoToInclude<CR>

nnoremap <leader>ytc :YcmCompleter GoToImprecise<CR>

" Get*
nnoremap <leader>yip :YcmCompleter GetParent<CR>

" utils
nnoremap <leader>ys :YcmCompleter ReloadSolution<CR>