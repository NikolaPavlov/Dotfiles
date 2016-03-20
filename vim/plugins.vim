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
