-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--------------------------------------------
-- my keymaps
--------------------------------------------
local map = vim.keymap.set
local cmd = vim.cmd

map("n", "<Space>", ":")
-- map('n', '<C-t>', ':NERDTreeToggleVCS<CR>')

map("i", "jk", "<Esc>")
map("c", "jk", "<Esc>")
map("i", "йк", "<Esc>")
map("c", "йк", "<Esc>")

map("n", "<leader><leader>", ":noh<CR>")
map("v", "<leader><leader>", "<Esc>")
map("n", "<leader>a", "ggVG")
map("n", "<leader><CR>", ":Oil --float<CR>")
map("n", "<leader>o", ":MaximizerToggle<CR>")
map("n", "<leader>d", ":bd<CR>")
map("n", "<CR>", ":b# <CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

-- File navigations
map("n", "<leader>s", ":Startify<CR>")
map("n", "<leader>el", ":NERDTree /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ <CR>")

-- Better searching
map("n", "/", "/\\v")
map("n", "?", "?\\v")

-- Windows moving
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Folds
map("n", "<BS>", "za")

-- Split lines with S
map("n", "S", 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w"{{{}}}')

-- j k moves inside wrapped lines
-- map("n", "j", "gj")
-- map("n", "k", "gk")

-- keep the cursor in place when joining lines
map("n", "J", "mzJ`z")

-- Undo break points, prevent undo all line
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ":", ":<c-g>u")
map("i", "_", "_<c-g>u")

-- insert empty line before/after line
map("n", "-", "mzO<Esc>`z")
map("n", "=", "mzo<Esc>`z")

-- replace the name of variable in current file
map("n", "cv", ":%s/\\<<C-r><C-w>\\>/")

-- swap splits
map("n", "s", "<C-w>r")

-- SSH copy paste (OSC52)
map("v", "<leader>y", "<Plug>OSCYankVisual<CR>")

-- move visualy selected text up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- centered scrollin
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- paste to set up indentation
map("n", "p", "p=`]")
map("n", "P", "[P")

-- vv select the line without the spaces
map("n", "vv", "^vg_")

-- Y to copy unthil the end of line
map("n", "Y", "yg$")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Go to the end of line in insert mode
map("i", "<C-a>", "<C-o>$")

-- map("n", "T", ":TagbarToggle<CR>")

-- OTHER
map("c", "zen", ":ZenMode<CR>")
-- map("c", "ps<CR>", ":PackerSync<CR>")
map("c", "ls<CR>", ":Lazy sync<CR>")
map("c", "logd<CR>", ":!rm -rf /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core<CR>")

-- Save as sudo
-- map("c", "w!!", ':w !sudo tee "%"<CR>')
-- map("c", "W!", ':w !sudo tee "%"<CR>')
-- vim.keymap.set('c', 'w!!', 'cmap w!! w !sudo tee > /dev/null %')
-- # TODO:
vim.keymap.set("c", "w!!", ":w ! sudo tee % > /dev/null")

-- Format xml (visual selectd xml + <leader>x)
map("v", ":xml", ":! xmllint --format -<CR>")
map("v", "f", ":! python -m json.tool<CR>")

-- Quick navigation CORE WEB
map("n", "<leader>c", ":Oil --float /mnt/core/home/n.pavlov/easypay_core<CR>")
map("n", "<leader>w", ":Oil --float /mnt/web/home/n.pavlov/easypay_web<CR>")

-- check Perl syntax
map(
  "c",
  "prl",
  ":!perl -I /usr/local/remedy2/COMMON/lib -I /usr/local/remedy2/CORE/lib -I /usr/local/remedy2/SYS/easypay_n.pavlov/CORE/lib -c %<CR>"
)

map("n", "<leader>u", cmd.UndotreeToggle)
map("c", "cd %", ":cd %:h")

-- TODO: leap --------------------------------------------------
vim.keymap.set({ "n", "x" }, "q", function()
  local current_window = vim.fn.win_getid()
  require("leap").leap({ target_windows = { current_window } })
  -- require("leap").add_default_mappings()
end)
-- vim.keymap.set({ "n", "x", "o" }, "ss", "<Plug>(leap-forward)")
-- vim.keymap.set({ "n", "x", "o" }, "SS", "<Plug>(leap-backward)")
------------------------------------------------------------------
