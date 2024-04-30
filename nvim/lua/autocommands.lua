local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- When editing a file always jump to the last known location
cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
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

-- FileType .def
cmd [[
    augroup ft_def
        au!
        au BufNewFile,BufRead *.def set wrap textwidth=120
        au BufNewFile,BufRead *.def set colorcolumn=120
        autocmd FileType def setlocal ts=2 sts=2 sw=2 expandtab
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

-- FileType norg
cmd [[
    autocmd FileType norg setlocal shiftwidth=2 softtabstop=2 expandtab
]]

-- FileType Lua
cmd [[
    augroup ft_lua
        au!
        au FileType lua set foldmethod=indent
        autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
    augroup END
]]

-- Filetype HTML
cmd [[
  augroup ft_htmldjango
    au!
    au FileType html setlocal nowrap
  augroup END
]]

-- autosave
-- cmd [[
--     autocmd CursorHold,CursorHoldI * update
-- ]]

-- don't auto commenting new lines
-- cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType ft_def,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]
