nnoremap [op :set clipboard=unnamed<CR>
nnoremap ]op :set clipboard=<CR>

nnoremap cop :set <C-R>=&clipboard == 'unnamed' ? 'clipboard=' : 'clipboard=unnamed'<CR><CR>
