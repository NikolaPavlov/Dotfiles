"{{{ Plugins
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim') " autocomplete engine
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('mhinz/vim-signify') " show git diff in the left bar
    call dein#add('wellle/targets.vim') " add 'ci(' command
    call dein#add('tpope/vim-surround') " change surroundings
    call dein#add('tpope/vim-repeat') " repeat surround commands
    call dein#add('tpope/vim-unimpaired') " set of usefull mappings
    call dein#add('tomtom/tcomment_vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin') " showing git status flags in nerdtree
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('ryanoasis/vim-devicons') " icons in vim (nerdtree, ctrlP)
    call dein#add('jiangmiao/auto-pairs') " match quotes, brackets, parenthesis
    call dein#add('Valloric/MatchTagAlways') " always highlight html enclosing tags
    call dein#add('flazz/vim-colorschemes') "many colorschemes currently badwolf
    call dein#add('junegunn/goyo.vim') "focus mode :Goyo
    call dein#add('machakann/vim-highlightedyank') "fast highlight yanked test
    call dein#add('kshenoy/vim-signature') "display the marks in the side line
    call dein#add('lfv89/vim-interestingwords') " colorize interesting words with <leader>k
    call dein#add('ap/vim-buftabline') " buffers in the tabline of vim
    call dein#add('yuttie/comfortable-motion.vim') "scroll effect
    call dein#add('Rykka/riv.vim') " note taking in vim with .rst
    call dein#add('gu-fan/InstantRst') " rst instant preview :rivquickstart for help
    call dein#add('vifm/vifm.vim') " :Vifm :help vifm
    call dein#add('Yggdroot/indentLine') " Showing indentation lines
    call dein#add('godlygeek/tabular') " align text
    call dein#add('sjl/gundo.vim') " undo history
    call dein#add('majutsushi/tagbar') " display tags <T>
    call dein#add('mileszs/ack.vim') " grep replacement
    " call dein#add('davidhalter/jedi-vim') "need for go to definitions
    " call dein#add('zchee/deoplete-jedi') "jedi vim completion async with deoplete
    " call dein#add('w0rp/ale') " linter on the fly (flake8 should be installed locally)
    " call dein#add('sbdchd/neoformat') " formater (black + isort should be installed locally)
    " call dein#add('Vimjas/vim-python-pep8-indent') " better indent for python
    " call dein#add('nvie/vim-flake8') " flake8
    " call dein#add('bronson/vim-trailing-whitespace') " colorize red trailing whitspaces
    " call dein#add('kassio/neoterm') " terminal helper (send lines directly to Repl)
    call dein#add('easymotion/vim-easymotion') " easy motion
    " call dein#add('gorodinskiy/vim-coloresque') "css,html,sass,less color prewiev
    call dein#add('junegunn/vim-slash') " improve highlight search (blinking currsor)
    " call dein#add('tpope/vim-fugitive') "git wrapper
    " call dein#add('chrisbra/csv.vim') " csv files formating
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

filetype plugin indent on
syntax enable

"}}}
" {{{ Plugin Options
" {{{ Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:AutoPairsMapCR=0
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#enable_smart_case = 1

    imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
    imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
" }}}
" {{{ NeoSnippet-snippets
    let g:neosnippet#snippets_directory="$HOME/Documents/Repos/Dotfiles/NeoSnippets"

    imap <C-j>     <Plug>(neosnippet_expand_or_jump)
    smap <C-j>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-j>     <Plug>(neosnippet_expand_target)
" }}}
" {{{ Jedi-vim
    " jedi vim is used for GO TO definitions
    let g:jedi#completions_enabled = 0 " disable jedi-vim autocompletion, we use deoplete-jedi for that
    let g:jedi#goto_command = "<leader>G"
    " let g:jedi#goto_assignments_command = "<leader>g"
    " let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#rename_command = "<leader>r"
" }}}
" {{{ Neoformat
    let g:neoformat_run_all_formatters = 1
    let g:neoformat_enabled_python = ['black', 'isort']
    let g:neoformat_enabled_javascript = ['js-beautify']
    let g:neoformat_basic_format_align = 1 " Enable alignment
    let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
    let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
" }}}
" {{{ NerdTree
    let NERDTreeShowBookmarks = 1  " Display bookmarks on startup.
    let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
    let NERDTreeMapOpenInTab='<leader>t' "remap 't' because we use it for open/close nerdtree

    autocmd BufEnter * lcd %:p:h " synchronize NerdTree to the current dir when 'nvim .'

    " autoclose vim if only open window is NerdTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" }}}
" {{{ Fugitive
    " https://www.grzegorowski.com/using-vim-or-neovim-nvim-as-a-git-mergetool/
    "
    "
    " :Gstatus
    " :Gpush
    " :Gpull
    " :Gcommit
    " :Gdiff
    " :Gmerge
    " :Glog
    " :Gblame
    " :Gread (gir reset --hard HEAD)
    " :Gwrite
" }}}
" {{{ VimSlash
  if has('timers')
    " Blink 2 times with 50ms interval
   noremap <expr> <plug>(slash-after) slash#blink(2, 50)
  endif
" }}}
" {{{ InstantRst
    let g:instant_rst_localhost_only = 1
" }}}
" {{{ Goyo
    let g:goyo_width=120
" }}}
"{{{ Easymotion
    noremap <localleader> <Plug>(easymotion-prefix)
    " <localleader>f[char]
    " <localleader>w
"
"}}}
"{{{ CtrlP
    let g:ctrlp_by_filename = 0 " search by filename instead of full path
    set wildignore+=*/.git/*
    let g:ctrlp_match_window = 'bottom,order:tbb,min:1,max:10,results:10'
"}}}
" }}}
"{{{ Filetype specific
"{{{ All Files
    " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    augroup remember_folds
        autocmd!
        au BufWinLeave ?* mkview 1
        au BufWinEnter ?* silent! loadview 1
    augroup END

    " augroup auto_save_folds
    "     autocmd!
    "     autocmd BufWinLeave * mkview
    "     autocmd BufWinEnter * silent loadview
    " augroup

"}}}
"{{{ Perl
    augroup ft_perl
        au!
        au BufNewFile,BufRead *.pl set wrap textwidth=120
        au BufNewFile,BufRead *.pl set colorcolumn=120
        au BufNewFile,BufRead *.t set filetype=perl
        au BufNewFile,BufRead *.t set set nowrap
        au FileType perl set foldmethod=indent

        set keywordprg=perldoc\ -f " shift+K for perldocumentation in vim

        noremap <F5> :w<CR>:!perl %<CR>
        inoremap <F5> <Esc>:w<CR>:!perl %<CR>
    augroup END
"}}}
"{{{ Python
    augroup ft_python
        au!
        au BufNewFile,BufRead *.py set wrap textwidth=120
        au BufNewFile,BufRead *.py set colorcolumn=120
    augroup END
" }}}
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
"{{{ Html
    augroup ft_html
        au!
        au BufNewFile,BufRead *.html set filetype=html
        au BufNewFile,BufRead *.html set nowrap
        au BufNewFile,BufRead *.html set colorcolumn=

        autocmd FileType {html,css,xml,htmldjango} setlocal shiftwidth=2 tabstop=2 softtabstop=2

        autocmd BufWritePre,BufRead *.{html,css,xml,htmldjango} :normal gg=G
    augroup END
"}}}
"{{{ NeoSnippets
    au FileType neosnippet set noexpandtab
"}}}
"{{{ Text + rst + md
    augroup text_rst_md
        au!
        au BufNewFile,BufRead *.{txt,rst,md} set wrap textwidth=120
        au BufNewFile,BufRead *.{txt,rst,md} set colorcolumn=120
    augroup END
"}}}
"{{{ Yaml
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}
"{{{ Vim
    augroup filetype_vim
        au!
        au FileType vim setlocal foldmethod=marker
        au BufNewFile,BufRead *.vim setlocal nowrap
        au BufNewFile,BufRead *.vim setlocal colorcolumn=
        au BufNewFile,BufRead *.vim normal zM " autoclose folds when open .vim file
    augroup END
"}}}
"{{{ Gopass Files
" https://woile.github.io/gopass-cheat-sheet/
" https://woile.github.io/gopass-presentation/
    au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
"}}}
"{{{ CSV
    augroup ft_csv
        au!
        au BufNewFile,BufRead *.csv setlocal nowrap
        au BufNewFile,BufRead *.csv setlocal list
        au BufNewFile,BufRead *.csv setlocal listchars=tab:▸\ ,eol:¬
    augroup END
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
set cpoptions+=$ "$ show at the end of change range
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
set sidescrolloff=5 "number of col to show when scroll right
"5 syntax, highlighting and spelling
syntax on
set hlsearch "highlight all matches for the last used search pattern
set cursorline "highlight the screen line of the cursor
set colorcolumn=80 "columns to highlight (local to window)
highlight Comment cterm=italic
"6 multiple windows
set laststatus=2 "when to show status line (2 = always)
set statusline=%.40F%=%y%4l\ \|\%-4L
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
set textwidth=119 "line length above which to break the line
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
" set foldlevelstart=10 "open most folds by default
set foldlevelstart=0 "close most folds by default
"17 diff mode
"18 mapping
"19 reading and writing files
set autoread "auto read file when it was modified outside of vim
set autowriteall " automatically write file when leaving modified buffer
"20 the swap file
set directory=$HOME/.config/nvim/swap// "dir for swap files
"21 command line editing
set wildmenu "comand line completion show a list of matches
set wildmode=full "specifies how command line completion works
"22 executing external commands
"23 running make and jumping to errors
"24 language specific
"25 multi-byte characters
" set fileencoding=utf-8 :TODO
set encoding=utf-8
"26 various
set gdefault "use 'g' flag for ':substitute' ('g' - global)
set t_Co=256
colorscheme badwolf
" colorscheme goodwolf
" colorscheme distinguished
" colorscheme jellybeans
" =============================================================================
" NVIM specific settings
set clipboard+=unnamedplus
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
let mapleader=','
" let maplocalleader='\<Space>' "TODO:
" {{{ Open files
    nnoremap <leader>ev :e $MYVIMRC<CR>
    nnoremap <leader>eb :e ~/Documents/Repos/Dotfiles/.bashrc<CR>
    nnoremap <leader>ew :e ~/Documents/Repos/Wiki/index.rst<CR>
    nnoremap <leader>et :e ~/Temp/temp.pl<CR>
" }}}
" {{{ Other
    "Tab for navigating between split screens
    nnoremap <leader><space> <c-w><c-w> " navigation between vsp
    nnoremap / /\v
    nnoremap ? ?\v
    nnoremap j gj
    nnoremap k gk
    " nnoremap j +
    " nnoremap k -
    nnoremap <leader><leader> :noh<cr>
    nnoremap ; :
    nnoremap <silent><leader>s :set spell!<CR>
    nnoremap <BS> za
    vnoremap <leader><leader> <Esc>
    noremap <leader>a ggVG
    vnoremap <leader>s :sort<CR>
    vnoremap < <gv
    vnoremap > >gv
    "substitute with ctrl + s
    " nnoremap <c-s> :%s/
    " vnoremap <c-s> :s/

    " replace the name of variable in current file
    nnoremap cv :%s/\<<C-r><C-w>\>/

    nnoremap n nzzzv
    nnoremap N Nzzzv

    "keep jumping results in the middle of the window
    nnoremap g; g;zz
    nnoremap g, g,zz
    "replace visualy selected text with the what is in the paste register
    vnoremap pp "+p
    "paste with indentation
    nnoremap p p=`]
    nnoremap P [P
    inoremap <C-a> <C-o>$
    " close current buffer
    nnoremap <leader>d :bd<CR>

    "Split line (sister to [J]oin lines)
    nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

    "forcing saving files that require root permission with :W
    command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" }}}
" {{{ Plugin based remaps
    " {{{ Buftabline
        nmap <leader>1 <Plug>BufTabLine.Go(1)
        nmap <leader>2 <Plug>BufTabLine.Go(2)
        nmap <leader>3 <Plug>BufTabLine.Go(3)
        nmap <leader>4 <Plug>BufTabLine.Go(4)
        nmap <leader>5 <Plug>BufTabLine.Go(5)
        nmap <leader>6 <Plug>BufTabLine.Go(6)
        nmap <leader>7 <Plug>BufTabLine.Go(7)
        nmap <leader>8 <Plug>BufTabLine.Go(8)
        nmap <leader>9 <Plug>BufTabLine.Go(9)
        nmap <leader>0 <Plug>BufTabLine.Go(10)
    " }}}
    nnoremap <leader>ir :InstantRst<CR>
    nnoremap t :NERDTreeToggle<CR>
    noremap <leader>c :TComment<cr>
    nnoremap <leader>g :Goyo<CR>
    nnoremap <leader>nf :Neoformat<cr>
    nnoremap <leader>u :GundoToggle<CR>
    nnoremap T :TagbarToggle<CR>
" }}}
" {{{ Windows moving
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
" }}}
"}}}
"{{{ Abbreviations
    iabbrev todo: TODO:
    iabbrev todo TODO:
    iabbrev TODO TODO:
    iabbrev pritn print
    iabbrev pirnt print
    iabbrev adn and
    iabbrev waht wath
    iabbrev tehn then
    iabbrev reutnr return
    iabbrev retunr return
    iabbrev reutrn return
    iabbrev retrun return
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
" :h nvim
" vim.org
" http://vimcasts.org/
" http://vimawesome.com/
" http://learnvimscriptthehardway.stevelosh.com/
" https://vim.fandom.com/wiki/Category:VimTip ---> VimTips
" =============================================================================
"}}}
"{{{ Functions

    " :DiffSaved to see the diff between current buffer and file on disk
    function! s:DiffWithSaved()
        let filetype=&ft
        diffthis
        vnew | r # | normal! 1Gdd
        diffthis
        exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    endfunction
    com! DiffSaved call s:DiffWithSaved()


    " Close all open buffers on entering a window if the only
    " buffer that's left is the NERDTree buffer
    function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
        if winnr("$") == 1
            q
        endif
        endif
    endif
    endfunction
"}}}
"{{{ Garbage
    " let g:SuperTabDefaultCompletionType = "<c-n>"
    let g:SuperTabDefaultCompletionType = "context"
    " let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

    " color for matching brackets
    hi MatchParen cterm=none ctermbg=green ctermfg=none

    " show the whitespaces
    " highlight RedundantSpaces ctermbg=red guibg=red

    " highlight trailing whitespace
    match ErrorMsg '\s\+$'
    " remove trailing whitespaces automatically   " match RedundantSpaces /\s\+$/
    autocmd BufWritePre * :%s/\s\+$//e
"}}}

" TODO: add 10j 2k type of movements to the jump list?
" TODO: lazy loading dein
" TODO: prevent nvim from nesting in terminal buffer
" TODO:
" TODO: better folding experience
" :h movement
" [[ -> for movement
" ]h

set path=$PWD/**
set visualbell
