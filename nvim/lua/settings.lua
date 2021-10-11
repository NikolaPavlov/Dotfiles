local opt = vim.opt
local cmd = vim.cmd


----------------------------
cmd 'colorscheme gruvbox'
--cmd 'colorscheme badwolf'
----------------------------


opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
--opt.linebreak = true
--opt.&showbreak = '↳ '
opt.lazyredraw = true 
opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5
--opt.syntax = on
opt.hlsearch = true
opt.cursorline = true
--opt.colorcolumn = '80'
opt.laststatus=2
--opt.statusline=%.40F%=%y%4l\ \|\%-4L
opt.splitbelow = true
opt.splitright = true
opt.clipboard = 'unnamedplus'
opt.undofile = true
-- opt.undodir = '/home/gogo/.config/nvim/undo_dir//'
vim.g.undodir = '$XDG_DATA_HOME/.config/nvim/undo_dir//'
opt.textwidth=119
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth=4
opt.softtabstop=4
opt.tabstop=4
opt.shiftround = true
opt.autoread = true     --auto read file when it was modified outside of vim
opt.autowriteall = true --automatically write file when leaving modified buffer
-- opt.directory = '/home/gogo/.config/nvim/swap//' --dir for swap files
vim.g.directory = "$XDG_DATA_HOME/nvim/swap//" --dir for swap files
