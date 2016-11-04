" show me the hjkl bitch!
" =============================================================================
"  _      _       _
" | |    (_)     | |
" | |     _ _ __ | |
" | |    | | '_ \| |/ / __|
" | |____| | | | |   <\__ \
" |______|_|_| |_|_|\_\___/
" =============================================================================
" http://vimcasts.org/
" http://usevim.com
" http://vimawesome.com/ ---> vim plugins ratings
" http://www.vimbits.com/ ---> vim scripts
" http://bytefluent.com/vivify/ ---> color theme preview and creator
" http://vimdoc.sf.net (this is :help as html)
" =============================================================================
filetype off
" Setup DeinVim PluginManager -------------------------------------------------
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim/repos/github.com'))
  call dein#add('Shougo/dein.vim')

"------------------------>start installing plugins<----------------------------
  call dein#add('Shougo/deoplete.nvim') " autocomplete plugin like YouCompleteMe
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_start_length = 2
  " call dein#add('ervandew/supertab')


  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

  call dein#add('benekastah/neomake') " syntastic alternative
  call dein#add('airblade/vim-gitgutter') " show which line is delete,modified,edited
    let g:neomake_python_enabled_makers = ['pep8']
    " npm install -g jshint (install globally jshint)
    let g:neomake_javascript_enabled_makers = ['jshint']
    autocmd! BufWritePost * Neomake
  call dein#add('tpope/vim-surround') " change surroundings
  call dein#add('tomtom/tcomment_vim') " comment plugin
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin') " showing git status flags in nerdtree
  call dein#add('vim-airline/vim-airline')
  call dein#add('gorodinskiy/vim-coloresque') " css,html,sass,less color prewiev
  call dein#add('ryanoasis/vim-devicons') " icons in vim (nerdtree)
  call dein#add('jiangmiao/auto-pairs') " match quotes, brackets, parenthesis
  call dein#add('flazz/vim-colorschemes') " many colorschemes
  " call dein#add('easymotion/vim-easymotion') " vim easymotion plugin
  call dein#add('Valloric/MatchTagAlways') " always highlight enclosing tags
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('bronson/vim-trailing-whitespace') " colorize red trailing whitspaces
  call dein#add('sickill/vim-pasta') " Pasting in Vim with indentation adjusted to destination context (usefull for HTML)
  call dein#add('chrisgillis/vim-bootstrap3-snippets')
  call dein#add('maksimr/vim-jsbeautify')
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    " for json
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    " for jsx
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" "--------------------------->finish installing plugins<---------------------------
  if dein#check_install()
    call dein#install()
  endif
  call dein#end()
  filetype plugin indent on




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
nnoremap <leader><leader> :noh<cr>
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
"foldin all and unfolding all with <leader>f <leader>ff
nnoremap <leader>f zR
nnoremap <leader>ff zM
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
"edit vimrc in the current window
noremap <leader>e :e $MYVIMRC<CR>
"edit vimrc in vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Comment Keys
nnoremap <leader>c :TComment<cr>
vnoremap <leader>c :TComment<cr>
":Autoformat
noremap <F12> :Autoformat<CR>
" tab for fold and unfold
nnoremap <Tab> za

" highlight last inserted text
nnoremap gV `[v`]
"------------------------------------------------------------------------------
"forcing saving files that require root permission with :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"format html on read and write (remove spaces)
" autocmd BufRead,BufWritePre *.html normal gg=G

"run python code in vim <F5>
noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>

"auto chmod +x if file begin with #! and contains /bin/
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

"this is nedded for simply fold to work correctly
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" =============================================================================
"   ___                          _
"  / _ \___ _ __   ___ _ __ __ _| |
" / /_\/ _ \ '_ \ / _ \ '__/ _` | |
"/ /_\\  __/ | | |  __/ | | (_| | |
"\____/\___|_| |_|\___|_|  \__,_|_|
" =============================================================================
" :options options
"1 important
set nocompatible "don't behave like vi
"2 moving around, searching and patterns
set incsearch "show match for partly search command
set showmatch "when inserting a bracket, briefly jump to its match
set ignorecase "ignore case when using search pattern
set smartcase "override 'ignorecase' when pattern has upper chars
"3 tags
"4 displaying text
set wrap "long lines wrap
set linebreak "break long lines at char in 'breakat' (local to window)
let &showbreak = '↳ ' " string to put before wrapped screen lines
set number "show current line number
set relativenumber "show line numbers relative to the current line
set scrolloff=5 "number of screen lines to show around the cursor
"5 syntax, highlighting and spelling
syntax on
set hlsearch "highlight all matches for the last used search pattern
set background=dark
set cursorline "highlight the screen line of the cursor
set colorcolumn=80 "columns to highlight (local to window)
"6 multiple windows
set laststatus=2 "when to show status line (2 = always)
set splitbelow  "a new window is put below the current one
set splitright "a new window is put right of the current one
"7 multiple tab pages
"8 terminal
"9 using the mouse
"10 GUI
set guifont=Inconsolata\ 13
"11 printing
"12 messages and info
set showcmd "show command keys in the status line
"13 selecting text
set clipboard=unnamed
"set clipboard=unnamedplus
"14 editing text
set textwidth=79 "line length above which to break the line
"15 tabs and indenting
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting
set expandtab "expand tab to spaces in insert mode
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4 "number of spaces to insert for a <Tab>
set tabstop=4 "number of spaces a <Tab> in the text stands for
set shiftround "round to 'shiftwidth' for '<<' and '>>'
"16 folding
set foldmethod=indent
set foldlevel=99
set foldlevelstart=10 "fold level when open file
"17 diff mode
"18 mapping
"19 reading and writing files
set autoread "auto read file when it was modified outside of vim
"20 the swap file
set noswapfile
"21 command line editing
set wildmenu "comand line completion show a list of matches
set wildmode=full "specifies how command line completion works
"22 executing external commands
"23 running make and jumping to errors
"24 language specific
"25 multi-byte characters
set fileencoding=utf-8
set encoding=utf-8
"26 various
set gdefault "use 'g' flag for ':substitute' ('g' - global)
"
set t_Co=256
colorscheme distinguished
" =============================================================================
"set lazyredraw
"
" NVIM specific settings
set clipboard+=unnamedplus




