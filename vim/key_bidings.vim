let mapleader=","
"NerdTree bindings-------------------------------------------------------------
map <c-t> :NERDTreeToggle<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"Keys maps---------------------------------------------------------------------
"remap arrow keys to nothing
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
"better regular expressions searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
"move currsor with j and k on wrap lines too 
nnoremap j gj
nnoremap k gk
" no highlight
nnoremap <leader> :noh<cr>
" map ; to :
nnoremap ; :
"turn on off spell checking with ,s
nmap <silent><leader>s :set spell!<CR> 
"move current line up or down
nmap <C-S-k> ddkP
nmap <C-S-j> ddp
"move multiple selected lines up or down
vmap <C-S-k> xkP`[V`]
vmap <C-S-j> xp`[V`]
"folding and unfolding with Space
nnoremap <Space> za
"jk as Esc alternative
inoremap jk <Esc>
inoremap kj <Esc>
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
