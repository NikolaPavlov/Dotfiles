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
map('i', 'йк', '<Esc>')
map('c', 'йк', '<Esc>')

map('n', '<leader><leader>', ':noh<CR>')
map('v', '<leader><leader>', '<Esc>')
map('n', '<leader>a', 'ggVG')
map('n', '<leader>o', ':only<CR>')
map('n', '<leader>d', ':Bdelete<CR>')
map('n', '<CR>', ':b# <CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

-- File navigations
map('n', '<leader>s', ':Startify<CR>')
map('n', '<leader>el', ':NERDTree /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/ <CR>')

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
map('i', '_', '_<c-g>u')

-- insert empty line before/after line
map('n', '-', 'mzO<Esc>`z')
map('n', '=', 'mzo<Esc>`z')

-- replace the name of variable in current file
map('n', 'cv', ':%s/\\<<C-r><C-w>\\>/')

-- swap splits
map('n', 's', '<C-w>r')

-- SSH copy paste (OSC52)
map('v', '<leader>y', '<Plug>OSCYankVisual<CR>')

-- move visualy selected text up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- paste to set up indentation
map('n', 'p', 'p=`]')
map('n', 'P', '[P')

-- vv select the line without the spaces
map('n', 'vv', '^vg_')

-- Y to copy unthil the end of line
map('n', 'Y', 'yg$')

-- TODO: map is already taken (using opt.scrolloff=999 currently)
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Go to the end of line in insert mode
map('i', '<C-a>', '<C-o>$')

map('n', 'T', ':TagbarToggle<CR>')

-- OTHER
map('c', 'zen', ':ZenMode<CR>')
map('c', 'ps<CR>', ':PackerSync<CR>')
map('c', 'logd<CR>', ':!rm -rf /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/core<CR>')

-- Save as sudo
map('c', 'w!!', ':w !sudo tee "%"<CR>')
map('c', 'W!', ':w !sudo tee "%"<CR>')

-- Format xml (visual selectd xml + <leader>x)
map('v', ':xml', ':! xmllint --format -<CR>')
map('v', 'f', ':! python -m json.tool<CR>')

-- Quick navigation CORE WEB
map('n', '<leader>c', ':cd /mnt/core/home/n.pavlov/easypay_core<CR>')
map('n', '<leader>w', ':cd /mnt/web/home/n.pavlov/easypay_web<CR>')


map('c', 'dt', ':windo diffthis<CR>')
map('c', 'do', ':windo diffoff<CR>')
