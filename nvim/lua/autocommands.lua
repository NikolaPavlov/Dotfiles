-- FileType Vim
vim.cmd [[
	augroup filetype_vim
	    au!
	    au FileType vim setlocal foldmethod=marker
	    au BufNewFile,BufRead *.vim setlocal nowrapjj
	    au BufNewFile,BufRead *.vim setlocal colorcolumn=
	    au BufNewFile,BufRead *.vim normal zM " autoclose folds when open .vim file
	augroup END
]]

-- FileType Perl
vim.cmd [[
    augroup ft_perl
        au!
        au FileType perl set foldmethod=indent
        noremap <F5> :w<CR>:!perl %<CR>
        inoremap <F5> <Esc>:w<CR>:!perl %<CR>
    augroup END
]]
