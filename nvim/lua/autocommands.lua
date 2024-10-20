local cmd = vim.cmd

-- When editing a file always jump to the last known location
cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

-- FileType Perl
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.pl"},
  callback = function()
      vim.keymap.set("n", "<F5>", ":w<CR>:!perl %<CR>")
  end
})

-- FileType .def
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.def"},
  callback = function()
    vim.opt.textwidth=120
    vim.opt.colorcolumn="120"
    vim.opt.tabstop=2
    vim.opt.sts=2
    vim.opt.sw=2
  end
})

-- FileType Python
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  callback = function()
    vim.keymap.set("n", "<F6>", ":w<CR>:!python %<CR>")
    vim.keymap.set("i", "<F6>", "<Esc>:w<CR>:!python %<CR>")
  end
})

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

-- autosave # TODO: FIX: (errors in the log)
-- cmd [[
--     autocmd CursorHold,CursorHoldI * update
-- ]]

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType ft_def,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]
