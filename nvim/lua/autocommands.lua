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

-- FileType Python
cmd [[
    augroup ft_python
        au!
        au FileType python set foldmethod=indent
        noremap <F6> :w<CR>:!python %<CR>
        inoremap <F6> <Esc>:w<CR>:!python %<CR>
    augroup END
]]
--
-- FileType norg
cmd [[
    autocmd FileType norg setlocal shiftwidth=2 softtabstop=2 expandtab
]]

-- Lua
cmd [[
    augroup ft_lua
        au!
        au FileType lua set foldmethod=indent
    augroup END
]]

-- autosave
cmd [[
    autocmd CursorHold,CursorHoldI * update
]]
