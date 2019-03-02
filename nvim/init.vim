"{{{ Virtualenv fixer for neovim

let g:python_host_prog = expand('$HOME/.virtualenvs/neovim/bin/python')
let g:python3_host_prog = expand('$HOME/.virtualenvs/neovim/bin/python3.7')

" }}}
"{{{ Plugins

" =============================================================================
"  _____  _             _
" |  __ \| |           (_)
" | |__) | |_   _  __ _ _ _ __  ___
" |  ___/| | | | |/ _` | | '_ \/ __|
" | |    | | |_| | (_| | | | | \__ \
" |_|    |_|\__,_|\__, |_|_| |_|___/
"                  __/ |
"                 |___/
" =============================================================================

filetype off
"Setup DeinVim PluginManager -------------------------------------------------
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
  call dein#add('Shougo/deoplete.nvim') "autocomplete engine
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
  call dein#add('Shougo/context_filetype.vim') "completion from other opened files
  call dein#add('davidhalter/jedi-vim') "need for go to definitions
  call dein#add('zchee/deoplete-jedi') "jedi vim completion async with deoplete
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsListSnippets="<c-Tab>" "list the snippets
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsSnippetsDir = split(&runtimepath, ',')[0] . '/snips'
    let g:UltiSnipsSnippetDirectories = [g:UltiSnipsSnippetsDir]
  call dein#add('w0rp/ale') "linter on the fly
  call dein#add('sbdchd/neoformat') "formater
    " let g:neoformat_enabled_python = ['black', 'autopep8']
    let g:neoformat_enabled_python = ['autopep8']
    let g:neoformat_run_all_formatters = 1
    "let g:neoformat_verbose = 1 "debug setting for neoformat
    "let &verbose            = 1 "debug setting for neoformat
  call dein#add('Vimjas/vim-python-pep8-indent')
  call dein#add('mhinz/vim-signify') "show git diff in the left bar
  call dein#add('tpope/vim-fugitive') "git wrapper (integration)
  call dein#add('wellle/targets.vim') "add 'ci(' command
  call dein#add('tpope/vim-surround') "change surroundings
  call dein#add('tpope/vim-repeat') "repeat surround commands
  call dein#add('tomtom/tcomment_vim') "comment plugin
  call dein#add('janko-m/vim-test') "run tests from vim
  call dein#add('junegunn/gv.vim') "git log viewer
    let test#strategy = "neovim"
    let test#python#runner = 'pytest'
  call dein#add('907th/vim-auto-save') "auto save when exit normal mode
    let g:auto_save = 1  "enable AutoSave on Vim startup
    let g:auto_save_silent = 1  "do not display the auto-save notification
  call dein#add('scrooloose/nerdtree')
    let NERDTreeMapOpenInTab='<leader>t' "remap 't' because we use it for open/close nerdtree
  call dein#add('Xuyuanp/nerdtree-git-plugin') "showing git status flags in nerdtree
  call dein#add('jiangmiao/auto-pairs') "match quotes, brackets, parenthesis
  call dein#add('Valloric/MatchTagAlways') "always highlight html enclosing tags
  call dein#add('bronson/vim-trailing-whitespace') "colorize red trailing whitspaces
  call dein#add('tmhedberg/SimpylFold') "fold manager for python (improve folding)
    let g:SimpylFold_docstring_preview=1 "display docstrings in folds
  call dein#add('ryanoasis/vim-devicons') "icons in vim (nerdtree, airline, ctrlP)
  call dein#add('tweekmonster/impsort.vim') "import sorting
  call dein#add('ervandew/supertab')
    let g:SuperTabDefaultCompletionType = "<c-n>" "complete from top to bottom
  call dein#add('gorodinskiy/vim-coloresque') "css,html,sass,less color prewiev
  call dein#add('flazz/vim-colorschemes') "many colorschemes
  " call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
    " let g:airline_theme='badwolf'
    " let g:airline_theme='bubblegum'
  call dein#add('cloudhead/neovim-fuzzy') "fzy implementation for neovim :Goyo
  call dein#add('junegunn/limelight.vim') "lime line focus rice <leader>l
  call dein#add('junegunn/goyo.vim') "focus mode :Goyo
  call dein#add('mbbill/undotree') "undo history :UndotreeShow
  call dein#add('machakann/vim-highlightedyank') "fast highlight yanked test
  call dein#add('kshenoy/vim-signature') "display the marks in the side line

  call dein#add('umutcoskun/vim-mule')
    "Selected interpreter to run commands.
    let g:mule_python_command = 'python3'
    "Auto enable virtual environment.
    let g:mule_auto_env = 1
    "No default mule hotkeys
    let g:mule_no_hotkeys = 1

  call dein#add('lfv89/vim-interestingwords') " colorize interesting words with <leader>k

  call dein#add('junegunn/vim-slash') " improve highlight search
  if has('timers')
    " Blink 2 times with 50ms interval
   noremap <expr> <plug>(slash-after) slash#blink(2, 50)
  endif

  call dein#add('vim-scripts/bufexplorer.zip') " :BufExplorer

  call dein#add('itchyny/lightline.vim')
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }


  call dein#add('Rykka/riv.vim')
  call dein#add('gu-fan/InstantRst') " rst instant preview
    let g:instant_rst_localhost_only = 1

  "https://github.com/tweekmonster/django-plus.vim
"--------------------------->finish installing plugins<---------------------------
  call dein#end()
  call dein#save_state()
  if dein#check_install()
    call dein#install()
  endif
  filetype plugin indent on
"}}}
"{{{ Remaps

" =============================================================================
"  _____
" |  __ \
" | |__) |___ _ __ ___   __ _ _ __  ___
" |  _  // _ \ '_ ` _ \ / _` | '_ \/ __|
" | | \ \  __/ | | | | | (_| | |_) \__ \
" |_|  \_\___|_| |_| |_|\__,_| .__/|___/
"                            | |
"                            |_|
" =============================================================================

let mapleader=","
"Markdown preview
map <leader>md :MarkdownPreview<CR>
"NerdTree bindings-------------------------------------------------------------
nmap t :NERDTreeToggle<CR>
" nmap tb :NERDTreeFromBookmark 
"Tab for navigating between split screens
nmap <tab> <c-w><c-w>
" autoclose vim if only open window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Keys maps---------------------------------------------------------------------
"better regular expressions searching
nmap / /\v
nmap ? ?\v
"move currsor with j and k on wrap lines too
nmap j gj
nmap k gk
" no highlight
nmap <leader><leader> :noh<cr>
" map ; to :
nmap ; :
"turn on off spell checking with ,s
nmap <silent><leader>s :set spell!<CR>
"folding and unfolding with Space
nmap <Space> za
"jj as Esc alternative
inoremap jj <Esc>
"select all text
map <leader>a ggVG
"sort selected text
vmap <leader>ss :sort<CR>
"moving code blocks
vmap < <gv
vmap > >gv
"substitute with ctrl + s
nmap <c-s> :%s/
vmap <c-s> :s/
"edit vimrc in the current window
nmap <leader>e :e $MYVIMRC<CR>
"edit bashrc in the current window
nmap <leader>b :e ~/Documents/Repos/Dotfiles/bashrc<CR>
" open riv wiki index.rst
nmap <leader>w :e ~/Documents/Riv/index.rst<CR>
nmap <leader>ir :InstantRst<CR>
"keep search matches in the middle of the window
nmap <leader>j :e ~/Documents/Riv/JOURNAL.rst<CR>
nmap n nzzzv
nmap N Nzzzv
"keep jumping results in the middle of the window
nnoremap g; g;zz
nnoremap g, g,zz
"comment <leader>c
map <leader>c :TComment<cr>
"sorting the python imports
map <leader>is :ImpSort!<cr>
"replace visualy selected text with the what is in the paste register
vmap pp "+p
"remap ctrl+p to launch fzy search
nmap <c-p> :FuzzyOpen<CR>
"get current date
nmap <leader>d "=strftime("%d/%m/%y %H:%M:%S")<CR>P
"formating the file
nmap <leader>nf :Neoformat<cr>
"Django remaps (<C-H> == <BS> == Backspace)
" nmap <CR> :DjangoSwitch<CR>
"Goyo
nmap <leader>g :Goyo
"Split line (sister to [J]oin lines)
nmap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
"limelight
nmap <leader>l :Limelight

" TODO: add buffer aliases
" -----------------------------------------------------------------------------
"forcing saving files that require root permission with :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"run python code in vim <F5>
nmap <F5> <ESC>:w<CR>:execute "!python %"<CR>
" test mappings
nmap <silent> <leader>tt :TestSuite<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
"auto chmod +x if file begin with #! and contains /bin/
au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
\ endif
"------------------------------------------------------------------------------
"}}}
"{{{ Filetype specific
"{{{ Django

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR

    au BufNewFile,BufRead admin.py setlocal filetype=python.django
    au BufNewFile,BufRead urls.py setlocal filetype=python.django
    au BufNewFile,BufRead models.py setlocal filetype=python.django
    au BufNewFile,BufRead views.py setlocal filetype=python.django
    au BufNewFile,BufRead forms.py setlocal filetype=python.django

    au BufNewFile,BufRead base.py setlocal filetype=python.django
    au BufNewFile,BufRead base.py setlocal foldmethod=marker
    au BufNewFile,BufRead dev.py setlocal filetype=python.django
    au BufNewFile,BufRead dev.py setlocal foldmethod=marker
    au BufNewFile,BufRead prod.py setlocal filetype=python.django
    au BufNewFile,BufRead prod.py setlocal foldmethod=marker
augroup END

" }}}
"{{{ Html Django

" no line wrap for html files
augroup ft_html
    au!

    au BufNewFile,BufRead *.html set nowrap textwidth=120
    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *.htmldjango set nowrap textwidth=120
    au BufNewFile,BufRead *.dram setlocal filetype=htmldjango

    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Indent tag
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

"}}}
"{{{ Vagrant

augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END

"}}}
"{{{ Vim

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=79

    " autoclose folds when open .vim file
    au BufNewFile,BufRead *.vim normal zM

augroup END

"}}}
"{{{ Text

" no line wrap for txt files
au BufNewFile,BufRead *.txt set wrap textwidth=80

"}}}
"}}}
"{{{ General :options

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
set lazyredraw "don't redraw while executing macros
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
set mouse=a " scroll in files and resize windows
"10 GUI
" set guifont=Inconsolata\ 13
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
"11 printing
"12 messages and info
set showcmd "show command keys in the status line
set noshowmode "don't display the current mode in the status line
"13 selecting text
set clipboard=unnamed
"set clipboard=unnamedplus
"14 editing text
set undofile " activate persistent undo
set undodir=~/.config/nvim/undo_dir " dir for saving persistent undo files
set textwidth=79 "line length above which to break the line
"15 tabs and indenting
set autoindent "automatically set the indent of a new line
set smartindent "do clever autoindenting for next line (after if for etc.)
set expandtab "expand tab to spaces in insert mode
set shiftwidth=4 "number of spaces used for each step of (auto)indent
set softtabstop=4 "number of spaces to insert for a <Tab>
set tabstop=4 "number of spaces a <Tab> in the text stands for
set shiftround "round to 'shiftwidth' for '<<' and '>>'
"16 folding
set foldmethod=indent
set foldlevel=99
set foldlevelstart=10 "open most folds by default
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
set t_Co=256
colorscheme badwolf
" colorscheme distinguished
" colorscheme jellybeans
" colorscheme goodwolf
" =============================================================================
" NVIM specific settings
set clipboard+=unnamedplus
"
"}}}
"{{{ Abbreviations

iabbrev todo TODO:
iabbrev todo: TODO:
iabbrev TODO TODO:
iabbrev pritn print

"}}}
"{{{ Links
" =============================================================================
"  _      _       _
" | |    (_)     | |
" | |     _ _ __ | |
" | |    | | '_ \| |/ / __|
" | |____| | | | |   <\__ \
" |______|_|_| |_|_|\_\___/
" =============================================================================
" vim.org
" http://vimcasts.org/
" http://vimawesome.com/
" http://learnvimscriptthehardway.stevelosh.com/
" =============================================================================
"}}}
"{{{ Garbage

" viewing python documentation on the word under the cursor with 'K'
function! ShowPydoc(what)
  let bufname = a:what . ".pydoc"
  " check if the buffer exists already
  if bufexists(bufname)
    let winnr = bufwinnr(bufname)
    if winnr != -1
      " if the buffer is already displayed, switch to that window
      execute winnr "wincmd w"
    else
      " otherwise, open the buffer in a split
      execute "sbuffer" bufname
    endif
  else
    " create a new buffer, set the nofile buftype and don't display it in the
    " buffer list
    execute "split" fnameescape(bufname)
    setlocal buftype=nofile
    setlocal nobuflisted
    " read the output from pydoc
    execute "r !" . shellescape(s:pydoc_path, 1) . " " . shellescape(a:what, 1)
  endif
  " go to the first line of the document
  1
endfunction

"}}}
