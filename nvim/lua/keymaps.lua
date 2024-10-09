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

map("i", "jk", "<Esc>")
map("c", "jk", "<Esc>")
map("i", "йк", "<Esc>")
map("c", "йк", "<Esc>")

map("n", "<leader><leader>", ":noh<CR>")
map("v", "<leader><leader>", "<Esc>")
map("n", "<leader>a", "ggVG")
map("n", "<leader><CR>", ":Oil --float<CR>")
map("n", "<leader>o", ":MaximizerToggle<CR>")

-- map("n", "<leader>d", ":bd<CR>")
map("n", "<leader>d", ":bp <BAR> bd #<CR>")

map("n", "<CR>", ":b# <CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

-- File navigations
map("n", "<leader>s", ": lua MiniStarter.open()<CR>")
-- map("n", "<leader>el", ":NERDTree /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ <CR>")
-- map("n", "<leader>c", ":NERDTree /mnt/core/home/n.pavlov/easypay_core<CR>")
-- map("n", "<leader>w", ":NERDTree /mnt/web/home/n.pavlov/easypay_web<CR>")
map("c", "logd<CR>", ":!rm -rf /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core<CR>")
map("n", "<leader>cc", ":cd /mnt/core/home/n.pavlov/easypay_core<CR>")
map("n", "<leader>cw", ":cd /mnt/web/home/n.pavlov/easypay_web<CR>")


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

-- OTHER
map("c", "zen", ":ZenMode<CR>")
map("c", "ls<CR>", ":Lazy sync<CR>")
map("n", "<leader>u", cmd.UndotreeToggle)
map("c", "cd .", ":cd %:h")

-- Format xml (visual selectd xml + <leader>x)
map("v", ":xml", ":! xmllint --format -<CR>")
map("v", "f", ":! python -m json.tool<CR>")

-- check Perl syntax
map(
  "c",
  "prl",
  ":!perl -I /usr/local/remedy2/COMMON/lib -I /usr/local/remedy2/CORE/lib -I /usr/local/remedy2/SYS/easypay_n.pavlov/CORE/lib -c %<CR>"
)

map("n", "<leader>u", cmd.UndotreeToggle)
map("c", "cd .", ":cd %:h")
map("n", "<leader>s", ": lua MiniStarter.open()<CR>")

vim.api.nvim_create_user_command("Stage", "'<,'>Gitsigns stage_hunk", { range = true })
map("n", "<leader>gb", ":G blame<CR>")

map("n", "<Left>", ":bprevious<CR>")
map("n", "<Right>", ":bnext<CR>")

map("n", "<leader>ss", ":mksession! ~/.config/nvim/sessions/mysession.vim<CR>")
map("n", "<leader>sl", ":source ~/.config/nvim/sessions/mysession.vim<CR>")

function live_grep_git_dir()
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  local opts = {
    cwd = git_dir,
  }
  require('telescope.builtin').live_grep(opts)
end
map("n", "<leader>r", ":lua live_grep_git_dir()<CR>")

-- vim.keys.normal_mode["<leader>gG"] = ":lua live_grep_git_dir()<CR>"

map('c', "so", ":luafile $MYVIMRC")
