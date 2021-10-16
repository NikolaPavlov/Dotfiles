local cmd = vim.cmd
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts) local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Space>', ':')

map('n', '<C-t>', ':NERDTreeToggleVCS<CR>')

map('i', 'jk', '<Esc>')
map('c', 'jk', '<Esc>')

map('n', '<leader><leader>', ':noh<CR>')
map('v', '<leader><leader>', '<Esc>')
map('n', '<leader>a', 'ggVG')
map('n', '<leader>o', ':only<CR>')
map('n', '<leader>d', ':bd<CR>')
map('n', '<CR>', ':b# <CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

-- File navigations
map('n', '<leader>s', ':Startify<CR>')
map('n', '<leader>ev', ':NERDTree ~/Documents/Repos/Dotfiles/nvim/lua <CR>')
-- map('n', '<leader>el', ':NERDTree /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ <CR>')
map('n', '<leader>eb', ':e ~/Documents/Repos/Dotfiles/.bashrc <CR>')
map('n', '<leader>ew', ':e ~/Documents/Repos/Wiki/index.rst <CR>')

-- Better searching
map('n', '/', "/\\v")
map('n', '?', "?\\v")

-- Windows moving
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Folds
map('n', '<BS>', 'za')

-- Split lines with S
map('n', 'S', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w"{{{}}}')

-- j k moves inside wrapped lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- keep the cursor in place when joining lines
map('n', 'J', 'mzJ`z')

-- Undo break points, prevent undo all line
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', ':', ':<c-g>u')

-- insert empty line before/after line
map('n', '-', 'mzO<Esc>`z')
map('n', '=', 'mzo<Esc>`z')

-- replace the name of variable in current file
map('n', 'cv', ':%s/\\<<C-r><C-w>\\>/')


-- TODO: fix copy paste
-- paste with indentation
    -- nnoremap p p=`]
    -- nnoremap P [P

-- replace visualy selected text with the what is in the paste register
    -- vnoremap pp "+p


-- TODO: testing ssh yank (OSC52)
map('v', '<leader>y', ':OSCYank<CR>')
