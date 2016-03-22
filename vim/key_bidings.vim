let mapleader=","
"NerdTree bindings-------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"Keys maps---------------------------------------------------------------------
" no highlight
nnoremap <leader> :noh<cr>
" map ; to :
nnoremap ; :
"turn on off spell checking with ,s
nmap <silent><leader>s :set spell!<CR> 
"move current line up or down
"nmap <C-k> ddkP
"nmap <C-j> ddp
"move multiple selected lines up or down
"vmap <C-k> xkP`[V`]
"vmap <C-j> xp`[V`]
"folding and unfolding with Space
nnoremap <Space> za
"jj as Esc alternative
inoremap jj <Esc>
"select all text
map <leader>a ggVG
"------------------------------------------------------------------------------
"forcing saving files that require root permission with :W
"cmap w!! %!sudo tee > /dev/null %
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"format html on read and write (remove spaces)
autocmd BufRead,BufWritePre *.html normal gg=G 

"run python code in vim <F5>
noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>

"auto chmod +x if file begin with #! and contains /bin/
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
"
" Shortkeys notes
" :! ---> run terminal commands from vim
" == ---> auto indent of the current visual selected block
" u ---> undo
" Ctrp+r ---> redo
" -10t. ---> copy relative line 10 lines above current to current
" -10t+20 ---> copy relative line -10 to line +20
"m[a] ---> mark current line as mark a
"'a ---> go to mark a
