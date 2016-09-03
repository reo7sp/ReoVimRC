if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.html = 'xhtml,css,stylus,less,sass,scss'
let g:context_filetype#same_filetypes.sass = 'scss,css,less,stylus'
let g:context_filetype#same_filetypes.scss = 'sass,css,less,stylus'
let g:context_filetype#same_filetypes.css = 'sass,scss,less,stylus'
let g:context_filetype#same_filetypes.gitconfig = '_'
