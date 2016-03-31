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
"move current line up or down with arrows
nmap <Up> ddkP
nmap <Down> ddp
"move multiple selected lines up or down with arrows
vmap <Up> xkP`[V`]
vmap <Down> xp`[V`]
"folding and unfolding with Space
nnoremap <Space> za
vnoremap <Space> za
"jj as Esc alternative
inoremap jj <Esc>
"select all text
map <leader>a ggVG
"sort selected text
vnoremap <leader>s :sort<CR>
"moving code blocks
vnoremap < <gv
vnoremap > >gv
"Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/
"edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
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

"syntastic check with F12
noremap <F12> :SyntasticCheck<CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
