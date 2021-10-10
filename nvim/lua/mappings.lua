vim.g.mapleader = ","

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Space>', ':')

map('n', '<C-t>', ':NERDTreeToggleVCS<CR>')

map('i', 'jk', '<Esc>')
map('c', 'jk', '<Esc>')

map('n', '<leader>s', ':Startify<CR>')
map('n', '<leader>eb', ':e ~/Documents/Repos/Dotfiles/.bashrc<CR>')
map('n', '<leader>ew', ':e ~/Documents/Repos/Wiki/index.rst<CR>')

map('n', '/', "/\\v")
map('n', '?', "?\\v")

map('n', '<leader><leader>', ':noh<CR>')
map('v', '<leader><leader>', '<Esc>')
map('n', '<leader>a', 'ggVG')
map('n', '<leader>o', ':only<CR>')
map('n', '<leader>d', ':bd<CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

-- Windows moving
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

--
-- FZF
map('n', '<leader>g', ':GFiles<CR>')
map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>l', ':Lines<CR>')
map('n', '<leader>t', ':Tags<CR>')
map('n', '<leader>r', ':Rg<CR>')
map('n', '<leader>h', ':Helptags!<CR>')


vim.api.nvim_exec(
  [[

  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_buffers_jump = 1

  ]],
  true
)
