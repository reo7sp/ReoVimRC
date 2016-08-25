map 0 ^
nnoremap j gj
nnoremap k gk
noremap <F1> <ESC>

inoremap jk <ESC>

noremap <S-Insert> <C-r>+
noremap! <S-Insert> <C-r>+

vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>

map zl zL
map zh zH

nnoremap Y y$

nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

cmap cwd cd %:p:h
cmap cd. cd %:p:h
cmap w!! w !sudo tee % >/dev/null
cmap bq bd

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

noremap <c-w>g :vertical wincmd f<CR>

nnoremap - :noh<cr>

nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
