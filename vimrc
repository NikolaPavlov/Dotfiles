" show me the hjkl bitch!
" =============================================================================
"  _      _       _        
" | |    (_)     | |       
" | |     _ _ __ | | _____ 
" | |    | | '_ \| |/ / __|
" | |____| | | | |   <\__ \
" |______|_|_| |_|_|\_\___/
" =============================================================================
" http://vimcasts.org/
" http://vimawesome.com/ ---> vim plugins
" http://www.vimbits.com/ ---> vim scripts
" http://bytefluent.com/vivify/ ---> color theme preview and creator
"
" http://vimdoc.sf.net (this is :help as html)
" =============================================================================
" /\   /\_   _ _ __   __| | | ___ 
" \ \ / / | | | '_ \ / _` | |/ _ \
"  \ V /| |_| | | | | (_| | |  __/
"   \_/  \__,_|_| |_|\__,_|_|\___|
" =============================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
"
"GitGutter---------------------------------------------------------------------
Plugin 'airblade/vim-gitgutter'
"------------------------------------------------------------------------------
"Aireline----------------------------------------------------------------------
Plugin 'bling/vim-airline'
"------------------------------------------------------------------------------
"NerdTree----------------------------------------------------------------------
Plugin 'scrooloose/nerdtree'
"------------------------------------------------------------------------------
"Python-Mode-------------------------------------------------------------------
Plugin 'klen/python-mode'
    " Override go-to.definition key shortcut to Ctrl-]
    let g:pymode_rope_goto_definition_bind = "<C-]>"
    " Override run current python file key shortcut to Ctrl-Shift-e
    let g:pymode_run_bind = "<C-S-e>"
    " Override view python doc key shortcut to Ctrl-Shift-d
    let g:pymode_doc_bind = "<C-S-d>"
    " Disable rope enable left for jedi
    let g:pymode_rope = 0 
"------------------------------------------------------------------------------
"YouCompleteMe-----------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'                             "Autocomplete addon
    let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

    let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
    let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    let g:ycm_complete_in_comments = 1 " Completion in comments
    let g:ycm_complete_in_strings = 1 " Completion in string
"------------------------------------------------------------------------------
"CtrlP-------------------------------------------------------------------------
Plugin 'kien/ctrlp.vim'                                           "Ctrl+P addon
"------------------------------------------------------------------------------
"UltiSnips---------------------------------------------------------------------
Plugin 'SirVer/ultisnips'                                        "Snippet addon
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"------------------------------------------------------------------------------
"Snippets collection-----------------------------------------------------------
Plugin 'honza/vim-snippets'                          "Default snipet collection
    "auto load django and htmldjango on startup for snippets
	autocmd FileType python set ft=python.django
	autocmd FileType html set ft=htmldjango.html
"------------------------------------------------------------------------------
"Syntastic----------------------------------------------------------------------
Plugin 'scrooloose/syntastic'                            "syntax errors checker
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
"------------------------------------------------------------------------------
"Nerdcommenter-----------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'                            "comments provider
"------------------------------------------------------------------------------
"EasyMotion--------------------------------------------------------------------
Plugin 'easymotion/vim-easymotion'                     "easy move between words
"<leader><leader>w        ---> find words
"<leader><leader>f<char>  ---> find chars
"------------------------------------------------------------------------------
"Surround----------------------------------------------------------------------
Plugin 'tpope/vim-surround'                            "surround text with tags 
"yss[new one]             ---> insert surrounding
"cs[current][new one]     ---> change surrounding
"ds[current]              ---> delete surrounding
"------------------------------------------------------------------------------
"Sparkup-----------------------------------------------------------------------
Plugin 'rstacruz/sparkup'                                   "fast html expander
"------------------------------------------------------------------------------
"VimIndent---------------------------------------------------------------------
Plugin 'nathanaelkane/vim-indent-guides'
"identation plugin <leader>ig for activating
"------------------------------------------------------------------------------
"AutoPairs---------------------------------------------------------------------
Plugin 'jiangmiao/auto-pairs'                 "auto complete pairs aka brackets
"------------------------------------------------------------------------------
"ColorSchemes------------------------------------------------------------------
Plugin 'flazz/vim-colorschemes'                       "massive amount of themes
"------------------------------------------------------------------------------
call vundle#end()

filetype plugin on
filetype plugin indent on 

" Brief vundle help
" :PluginList       - lists configured plugins
" :PluginUpdate     - update all plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" =============================================================================
"   ___                          _ 
"  / _ \___ _ __   ___ _ __ __ _| |
" / /_\/ _ \ '_ \ / _ \ '__/ _` | |
"/ /_\\  __/ | | |  __/ | | (_| | |
"\____/\___|_| |_|\___|_|  \__,_|_|
" =============================================================================
" :options

"1 important
set nocompatible "don't behave like vi

"2 moving around, searching and patterns
set incsearch "show match for partly search command
set showmatch "when inserting a bracket, briefly jump to its match
set ignorecase "ignore case when using search pattern
set smartcase "override 'ignorecase' when pattern has upper chars

"3 tags
"
"4 displaying text
"set number "show line nuber for each line
set wrap "long lines wrap
set linebreak "break long lines at char in 'breakat' (local to window)
set relativenumber "show line numbers relative to the current line
set scrolloff=2 "number of screen lines to show around the cursor

"5 syntax, highlighting and spelling
syntax on
set hlsearch "highlight all matches for the last used search pattern
set background=dark
set cursorline "highlight the screen line of the cursor
set colorcolumn=80 "columns to highlight (local to window)

"6 multiple windows
set laststatus=2 "when to show status line (2 = always)

"7 multiple tab pages

"8 terminal

"9 using the mouse

"10 GUI
set guifont=Inconsolata\ 13

"11 printing

"12 messages and info
set showcmd "show command keys in the status line

"13 selecting text
"set clipboard=unnamed
set clipboard=unnamedplus

"14 editing text
set textwidth=80 "line length above which to break the line

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

"17 diff mode

"18 mapping

"19 reading and writing files
set autoread "auto read file when it was modified outside of vim

"20 the swap file
set noswapfile

"21 command line editing
set wildmenu "comand line completion show a list of matches
set wildmode=full "specifies how command line completion works
"set undofile "automatically save and restore undo history

"22 executing external commands

"23 running make and jumping to errors

"24 language specific

"25 multi-byte characters
set fileencoding=utf-8
set encoding=utf-8

"26 various
set gdefault "use 'g' flag for ':substitute' ('g' - global)
"set edcompatible "use 'g' and 'c' flags for ':substitute' ('c' - confirmaton)

" =============================================================================
" =============================================================================
" =============================================================================
set t_Co=256
colorscheme distinguished
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
"turn on off spell checking
nmap <silent><leader>s :set spell!<CR> 
"move current line up or down
nmap <C-Up> ddkP
nmap <C-Down> ddp
"move multiple selected lines up or down
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"folding and unfolding with Space
nnoremap <Space> za



"------------------------------------------------------------------------------
"forcing saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

"format html on read and write (remove spaces)
autocmd BufRead,BufWritePre *.html normal gg=G 

"run python code in vim <F5>
noremap <F5> <ESC>:w<CR>:execute "!python %"<CR>


" Shortkeys notes
" :! ---> run terminal commands from vim
" == ---> auto indent of the current visual selected block
" u ---> undo
" Ctrp+r ---> redo
" -10t. ---> copy relative line 10 lines above current to current
" -10t+20 ---> copy relative line -10 to line +20
"m[a] ---> mark current line as mark a
"'a ---> go to mark a
