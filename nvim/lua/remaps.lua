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
map('i', 'kj', '<Esc>')
map('c', 'kj', '<Esc>')

map('n', '<leader><leader>', ':noh<CR>')
map('v', '<leader><leader>', '<Esc>')
map('n', '<leader>a', 'ggVG')
map('n', '<leader>o', ':only<CR>')
map('n', '<leader>d', ':bd<CR>')
map('n', '<CR>', ':b#<CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

-- File navigations
map('n', '<leader>s', ':Startify<CR>')
map('n', '<leader>ev', ':NERDTree ~/Documents/Repos/Dotfiles/nvim/lua <CR>')
map('n', '<leader>el', ':NERDTree /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ <CR>')
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

-- Abreviations
cmd[[:iabbrev todo TODO:]]
cmd[[:iabbrev todo: TODO:]]
cmd[[:iabbrev TODO TODO:]]
cmd[[:iabbrev pritn print]]
cmd[[:iabbrev pirint print]]
cmd[[:iabbrev reutnr return]]
cmd[[:iabbrev retunr return]]
cmd[[:iabbrev reutrn return]]
cmd[[:iabbrev retrun return]]

-- Temp Garbage
--
-- Insert empty line before/after line
map('n', '-', 'mzO<Esc>`z')
map('n', '=', 'mzo<Esc>`z')

-- TODO: fix copy paste
-- paste with indentation
    -- nnoremap p p=`]
    -- nnoremap P [P

-- replace visualy selected text with the what is in the paste register
    -- vnoremap pp "+p


-- TODO:
-- Re-centre as we're going along
 -- noremap j jzz 
 -- noremap k kzz 
 -- noremap n nzz 


   
