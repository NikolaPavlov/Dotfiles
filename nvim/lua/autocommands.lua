local function augroup(name)
  return vim.api.nvim_create_augroup("gh_" .. name, { clear = true })
end

-- Check if we should restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].gh_last_loc then
      return
    end
    vim.b[buf].gh_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- FileType Perl
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ft_perl"),
  pattern = "perl",
  callback = function()
    vim.keymap.set("n", "<F5>", ":w<CR>:!perl %<CR>", { buffer = true })
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- FileType .def
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ft_def"),
  pattern = "def",
  callback = function()
    vim.opt_local.textwidth = 120
    vim.opt_local.colorcolumn = "120"
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- FileType Python
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ft_python"),
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<F6>", ":w<CR>:!python %<CR>", { buffer = true })
    vim.keymap.set("i", "<F6>", "<Esc>:w<CR>:!python %<CR>", { buffer = true })
  end,
})

-- FileType Settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ft_settings"),
  pattern = { "norg", "lua", "xml", "html", "xhtml", "css", "scss", "javascript", "yaml" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Don't auto-comment new lines
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("no_auto_comment"),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Terminal settings
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("term_settings"),
  callback = function()
    vim.opt_local.listchars = ""
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup("term_leave"),
  pattern = "term://*",
  callback = function()
    vim.cmd("stopinsert")
  end,
})

-- Autosave
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = augroup("autosave"),
--   callback = function()
--     if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
--       vim.cmd("silent! update")
--     end
--   end,
-- })
