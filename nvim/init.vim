let mapleader=','
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
    call dein#add('kshenoy/vim-signature') " display the marks in the side line
    call dein#add('wellle/targets.vim') " add 'ci(' command
    call dein#add('tpope/vim-surround') " change surroundings
    call dein#add('tpope/vim-repeat') " repeat surround commands
    call dein#add('tpope/vim-fugitive') " git wrapper
    call dein#add('tpope/vim-unimpaired') " set of usefull mappings
    call dein#add('tomtom/tcomment_vim')
    call dein#add('scrooloose/nerdtree',
        \{'on_cmd': 'NERDTreeToggleVCS'})
    call dein#add('Xuyuanp/nerdtree-git-plugin',
        \{'on_cmd': 'NERDTreeToggleVCS'}) " showing git status flags in nerdtree
    " call dein#add('vifm/vifm.vim',
    "     \{'on_cmd': 'Vifm'}) " : Vifm :help vifm
    call dein#add('ryanoasis/vim-devicons') " icons in vim (nerdtree)
    call dein#add('jiangmiao/auto-pairs') " match quotes, brackets, parenthesis
    call dein#add('Valloric/MatchTagAlways',
        \{'on_ft': 'html'}) " always highlight html enclosing tags
    call dein#add('sjl/badwolf') " color theme
    call dein#add('nanotech/jellybeans.vim') " color theme
    " call dein#add('junegunn/goyo.vim',
    "     \{'on_cmd': 'Goyo'}) " focus mode :Goyo
    call dein#add('machakann/vim-highlightedyank') " fast highlight yanked test
    call dein#add('lfv89/vim-interestingwords') " colorize interesting words with <leader>k
    call dein#add('ap/vim-buftabline') " buffers in the tabline of vim
    call dein#add('yuttie/comfortable-motion.vim') "scroll effect
    call dein#add('Rykka/riv.vim',
        \{'on_ft': 'rst'}) " note taking in vim with .rst
    call dein#add('gu-fan/InstantRst',
        \{'on_ft': 'rst'}) " rst instant preview :rivquickstart for help
    call dein#add('Yggdroot/indentLine',
        \{'on_ft': ['perl', 'html']}) " Showing indentation lines
    call dein#add('godlygeek/tabular') " align text
    call dein#add('sjl/gundo.vim',
        \ {'on_ft': 'GundoToggle'}) " undo history
    " call dein#add('mileszs/ack.vim') " grep replacement
    call dein#add('dense-analysis/ale',
        \{'on_ft': ['perl', 'python', 'html']}) " linter on the fly (flake8 should be installed locally)
    call dein#add('junegunn/vim-slash') " improve highlight search (blinking currsor)
    call dein#add('chrisbra/csv.vim',
        \{'on_ft': 'csv'}) " csv files formating
    call dein#add('majutsushi/tagbar',
        \{'on_ft': 'perl'}) " display tags <T>
    call dein#add('jsfaint/gen_tags.vim') " https://github.com/jsfaint/gen_tags.vim
    " TODO: gutentags
    " TODO: vim-gutentags
    " TODO: check gutentags_plus
    " call dein#add('ludovicchabant/vim-gutentags') " auto re-generation of the tags files while working
    call dein#add('dm1try/golden_size') " auto resize splits
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('yuki-ycino/fzf-preview.vim')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " PYTHON
    " call dein#add('davidhalter/jedi-vim',
    "     \{'on_ft': 'python'}) " need for go to definitions
    " call dein#add('zchee/deoplete-jedi',
    "     \{'on_ft': 'python'}) " jedi vim completion async with deoplete
    " call dein#add('Vimjas/vim-python-pep8-indent',
    "     \{'on_ft': 'python'}) " better indent for python
    " call dein#add('nvie/vim-flake8',
    "     \{'on_ft': 'python'}) " flake8

    call dein#add('mhinz/vim-startify')
    "
    " call dein#add('sbdchd/neoformat') " formater (black + isort should be installed locally)
    " call dein#add('gorodinskiy/vim-coloresque') "css,html,sass,less color prewiev
    " call dein#add('kassio/neoterm') " terminal helper (send lines directly to Repl)
    " call dein#add('pechorin/any-jump.nvim')
    " call dein#add('bronson/vim-trailing-whitespace') " colorize red trailing whitspaces
    " TODO: https://github.com/unfog-io/unfog-vim
    " TODO: https://github.com/tpope/vim-commentary
    call dein#add('sjl/splice.vim.git')

endif

" dein#recache_runtimepath() " --> for cleaning plugins
" dein#check_clean()

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
    " let g:deoplete#auto_complete_start_length = 1
    " let g:deoplete#enable_smart_case = 1

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
    let g:neoformat_enabled_perl= ['perltidy']
    let g:neoformat_basic_format_align = 1 " Enable alignment
    let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
    let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace

    nnoremap <leader>nf :Neoformat<cr>

" }}}
" {{{ NerdTree

    " let NERDTreeMapOpenInTab='<leader>t' "remap 't' because we use it for open/close nerdtree
    autocmd FileType nerdtree setlocal relativenumber
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeBookmarksSort = 0
    let NERDTreeDirArrows = 1
    let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
    let NERDTreeMinimalUI = 1
    let NERDTreeQuitOnOpen = 0
    let NERDTreeShowBookmarks = 1  " Display bookmarks on startup.
    let NERDTreeShowLineNumbers = 1

    " :NerdTreeCWD -> anker NerdTree to the current dir
    " :Bookmark[<name>]
    " :ClearBookmarks [<bookmark>]
    " :EditBookmarks

    " ? - help
    " s - open in split
    " <C-J> - Jump down to the next sibling on the current dir
    " <C-K> - Jump up to prev sibling on the current dir
    " C - Change the tree root to the selectes dir
    " m - Display NerdTree menu
    " I - hidden files on/off
    " B - on/off Bookmark table
    " F - on/off File displaying

    " autocmd BufEnter * lcd %:p:h " synchronize NerdTree to the current dir when 'nvim .' TODO: bug with vs | te
    nnoremap <c-t> :NERDTreeToggleVCS<cr>

    "TODO: open NerdTree when open vim with no arguments
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif

" }}}
" {{{ Fugitive

    " https://www.grzegorowski.com/using-vim-or-neovim-nvim-as-a-git-mergetool/
    "
    " :Gstatus or :G
    " ---
    " :Gpull
    " :Gpush
    " ---
    " :Gwrite -> staging the file
    " :Gread (gir reset --hard HEAD)
    " :Gread -> (git checkout %) empty the current buffer and revert the last commit ver. of the file
    " :Gremove -> (git rm %)
    " ---
    " :Gcommit -> open buffer to write commit msg
    " :Gdiff
    " :Gmerge
    " :Gedit -> Gedit other_branch:filename -> open file from other branch read-only
    " :Gedit <sha512> -> read only specific git object
    " :Glog
    " ---
    " :Gblame
    " ---

" }}}
" {{{ VimSlash

    if has('timers')
    " Blink 3 times with 50ms interval
    noremap <expr> <plug>(slash-after) slash#blink(3, 50)
    endif

" }}}
" {{{ InstantRst

    let g:instant_rst_localhost_only = 1

    nnoremap <leader>ir :InstantRst<CR>

" }}}
" {{{ Goyo

    let g:goyo_width=120
    nnoremap <leader>g :Goyo<CR>

" }}}
"{{{ FZF

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'

    " Reverse the layout to make the FZF list top-down
    let $FZF_DEFAULT_OPTS='--layout=reverse'


    nnoremap <leader>g :GFiles<cr>
    nnoremap <leader>f :Files<cr>
    " nnoremap <c-t> :BTags<CR>
    nnoremap <leader>t :Tags<cr>
    " nnoremap <c-l> :BLines<CR>
    nnoremap <leader>l :Lines<cr>
    nnoremap <leader>m :Marks<cr>
    " use :Rg --files to list files searchable by Rg
    nnoremap <leader>r :Rg<cr>
    nnoremap <leader>h :Helptags!<cr>
    nnoremap <leader>p :FzfPreviewProjectFiles<cr>

    function! CreateCenteredFloatingWindow()
        let width = min([&columns - 4, max([80, &columns - 20])])
        let height = min([&lines - 4, max([20, &lines - 10])])
        let top = ((&lines - height) / 2) - 1
        let left = (&columns - width) / 2
        let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

        let top = "╭" . repeat("─", width - 2) . "╮"
        let mid = "│" . repeat(" ", width - 2) . "│"
        let bot = "╰" . repeat("─", width - 2) . "╯"
        let lines = [top] + repeat([mid], height - 2) + [bot]
        let s:buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
        call nvim_open_win(s:buf, v:true, opts)
        set winhl=Normal:Floating
        let opts.row += 1
        let opts.height -= 2
        let opts.col += 2
        let opts.width -= 4
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
        au BufWipeout <buffer> exe 'bw '.s:buf
    endfunction

    let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }


" }}}
" {{{ ALE

    let g:ale_perl_perlcritic_showrules = 1
    let g:ale_linters = {'perl': ['perl']}
    let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -It/lib'
    " let g:ale_type_map = {
    " \    'perl': {'ES': 'WS'},
    " \    'perlcritic': {'ES': 'WS', 'E': 'W'},
    " \}

    let g:ale_fixers = {
                \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                \   'perl': ['perltidy'],
                \    'html' : ['prettier'],
                \   'javascript': ['prettier'],
                \   'css': ['prettier'],
                \   'markdown' : ['prettier'],
                \   'json': ['prettier'],
                \}

" }}}
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
" {{{ TComment

    noremap <leader>c :TComment<cr>

" }}}
" {{{ Gundo

    nnoremap <leader>u :GundoToggle<CR>

" }}}
" {{{ Airline


    let g:airline_theme='minimalist'
    let g:airline_powerline_fonts = 1
    let g:airline_section_a = ''
    let g:airline_section_x = ''
    let g:airline_section_z = "%l/%L:%p%%"
    let g:airline_skip_empty_sections = 1
    let g:airline_inactive_collapse=1

    " TODO:
    " or only load what you want
    let g:airline_extensions = ['branch', 'tabline']
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = 'E:'
    let airline#extensions#ale#warning_symbol = 'W:'
    let airline#extensions#ale#show_line_numbers = 1
    let airline#extensions#ale#open_lnum_symbol = '(L'
    let airline#extensions#ale#close_lnum_symbol = ')'

    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#empty_message = ''
    let g:airline#extensions#branch#displayed_head_limit = 10
    let g:airline#extensions#branch#format = 1

    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#term#enabled = 1

    " Tabline
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    " * enable/disable displaying open splits per tab (only when tabs are opened) >
    " let g:airline#extensions#tabline#show_splits = 1
    " * enable/disable displaying buffers with a single tab. (c) >
    let g:airline#extensions#tabline#show_buffers = 1
    " * enable/disable displaying number of tabs in the right side (c) >
    let g:airline#extensions#tabline#show_tab_count = 0
    " * enable/disable display preview window buffer in the tabline. >
    let g:airline#extensions#tabline#exclude_preview = 0
    " * enable/disable displaying tab number in tabs mode. >
    let g:airline#extensions#tabline#show_tab_nr = 0
    " * always show current tabpage/buffer first >
    let airline#extensions#tabline#current_first = 0
    " * configure whether buffer numbers should be shown. >
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    " * configure truncating non-active buffer names to specified length. >
    let g:airline#extensions#tabline#fnametruncate = 0
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    " nmap <leader>1 <Plug>AirlineSelectTab1
    " nmap <leader>2 <Plug>AirlineSelectTab2
    " nmap <leader>3 <Plug>AirlineSelectTab3
    " nmap <leader>4 <Plug>AirlineSelectTab4
    " nmap <leader>5 <Plug>AirlineSelectTab5
    " nmap <leader>6 <Plug>AirlineSelectTab6
    " nmap <leader>7 <Plug>AirlineSelectTab7
    " nmap <leader>8 <Plug>AirlineSelectTab8
    " nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#tabline#fnametruncate = 8
    " * configure separators for the tabline only. >
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ' '
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ' '

    " TAGBAR
    let g:airline#extensions#tagbar#enabled = 1
    " * change how tags are displayed (:help tagbar-statusline) >
    let g:airline#extensions#tagbar#flags = ''
    let g:airline#extensions#tagbar#flags = 'f'
    let g:airline#extensions#tagbar#flags = 's'
    let g:airline#extensions#tagbar#flags = 'p'

    let g:airline#extensions#virtualenv#enabled = 1


    " TODO:
    " let g:airline_section_warning = ''
    " let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs

    " themes:
    " - hybrid
    " - minimalist
    " - zenburn

" }}}
" {{{ Tagbar

   nnoremap T :TagbarOpenAutoClose<Cr>

" }}}
" }}}
"{{{ Filetype specific
"{{{ All Files
" When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
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

	" autocmd FileType {html,css,xml,htmldjango} setlocal shiftwidth=2 tabstop=2 softtabstop=2

	" autocmd BufWritePre,BufRead *.{html,css,xml,htmldjango} :normal gg=G
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
"{{{ Def

    augroup ft_def
        au!
        au BufNewFile,BufReadPost *.def set filetype=def foldmethod=indent
        autocmd FileType def setlocal ts=2 sts=2 sw=2 expandtab
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
" set encoding=utf-8                   " for internal use, always utf8, there isn't need to specified this
" set fileencoding=iso-8859-1
set fileencoding=cp1251
" set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1251
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
" {{{ Remaps
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
" let mapleader=','
" TODO: localleader
let maplocalleader='\\'
" {{{ Open files
    " nnoremap <leader>ev :e $MYVIMRC<CR>
    nnoremap <leader>ev :e ~/Documents/Repos/Dotfiles/nvim/init.vim<CR>
    nnoremap <leader>eb :e ~/Documents/Repos/Dotfiles/.bashrc<CR>
    nnoremap <leader>ew :e ~/Documents/Repos/Wiki/index.rst<CR>
    nnoremap <leader>et :e ~/Temp/temp.pl<CR>
    nnoremap <leader>es :e ~/Documents/Repos/Dotfiles/NeoSnippets/<CR>
    " TODO: snippets
" }}}
" {{{ Other

    inoremap jk <Esc>
    " xnoremap jk <Esc>
    cnoremap jk <Esc>

    nnoremap <leader><space> <c-w><c-w> " navigation between vsp
    nnoremap / /\v
    nnoremap ? ?\v
    nnoremap j gj
    nnoremap k gk
    " nnoremap j +
    " nnoremap k -
    nnoremap <leader><leader> :noh<cr>
    " nnoremap ; :
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

    "use <leader>z to focus the current fold
    nnoremap zf zMzvzz

    " nnoremap : <Nop>
    noremap <space> :

    nnoremap <leader>w :w<cr>

" }}}
" {{{ Windows moving / opening

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " tnoremap <C-h> <C-\><C-n><C-w>h
    " tnoremap <C-j> <C-\><C-n><C-w>j TODO: conflict with fzf
    " tnoremap <C-k> <C-\><C-n><C-w>k
    " tnoremap <C-l> <C-\><C-n><C-w>l

"}}}
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
" :Tutor
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

    set path=$PWD/**
    " color for matching brackets
    hi MatchParen cterm=none ctermbg=green ctermfg=none

    " Show trailing whitespace:
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/

    nnoremap <Cr> :b#<CR>
    nnoremap <C-n> :Vexplore<CR>
    " Last inserted text
    nnoremap g. :normal! `[v`]<cr><left>

    " Keep the cursor on the same column
    set nostartofline

    " Movement in insert mode
"     inoremap <C-h> <C-o>h
"     inoremap <C-l> <C-o>a
"     inoremap <C-j> <C-o>j
"     inoremap <C-k> <C-o>k
"     inoremap <C-^> <C-o><C-^>
" "}}}

" :h movement
" [[ -> for movement
" ]h


hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta

"{{{ BadWolf Theme
    " Make the tab line much lighter than the background.
    let g:badwolf_tabline = 3
"}}}

set tags+=/mnt/core/home/n.pavlov/easypay_core/.git/tags


" temp for debug. see the logs with :messages
" let g:gutentags_trace = 1


" call fzf#run({'source': 'find /mnt/core/home/n.pavlov/easypay_core/CORE/lib /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ -type f', 'sink':  'edit'})

nnoremap <Leader>f :<C-U>call ABFiles()<CR>
"" Custom fzf find files in directory of active buffer
function! ABFiles()
    execute 'FZF' expand('%:p:h')
endfunction

nnoremap <leader>o :only<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>









" Empty lines above / below the current
" ======================================================================

"https://vim.fandom.com/wiki/Insert_newline_without_entering_insert_mode
map <t-Enter> O<Esc>
nmap <CR> o<Esc>

" mappings from unimpaired
" ]<Space> -> above the line
" [<Space> -> below the line

