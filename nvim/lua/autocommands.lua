local cmd = vim.cmd

-- auto recompile Packer
cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- When editing a file always jump to the last known location
cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

-- FileType Vim
cmd [[
	augroup filetype_vim
	    au!
	    au FileType vim setlocal foldmethod=marker
	    au BufNewFile,BufRead *.vim setlocal nowrapjj
	    au BufNewFile,BufRead *.vim setlocal colorcolumn=
	    au BufNewFile,BufRead *.vim normal zM " autoclose folds when open .vim file
	augroup END
]]

-- FileType Perl
cmd [[
    augroup ft_perl
        au!
        au FileType perl set foldmethod=indent
        noremap <F5> :w<CR>:!perl %<CR>
        inoremap <F5> <Esc>:w<CR>:!perl %<CR>
    augroup END
]]

-- Lua
cmd [[
    augroup ft_lua
        au!
        au FileType lua set foldmethod=indent
    augroup END
]]


-- Other
cmd [[
nmap <leader>y Osc52Yank()
    " Allows yanking even though SSH!!!
    " source:
    " https://github.com/fortes/dotfiles/blob/master/stowed-files/nvim/.vimrc
    " copy yank buffer to system clipboard
    " Use OSC52 to put things into the system clipboard, works over SSH!
    function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    " Need special escaping if within tmux
    if $TMUX != ''
        let buffer='\ePtmux;\e'.buffer.'\e\\'
    endif
    endfunction
]]
