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
