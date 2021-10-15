local opt = vim.opt
local cmd = vim.cmd


----------------------------
-- cmd 'colorscheme gruvbox'
cmd 'colorscheme badwolf'
----------------------------


opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true                            -- do not ignore case with capitals
opt.smartindent = true                          -- insert indents automatically
opt.wrap = false                                -- disable line wraps
--opt.linebreak = true
--opt.&showbreak = '↳ '
opt.lazyredraw = true 
opt.relativenumber = true
opt.scrolloff = 999                             -- big scrolloff to keep the search results centered
opt.sidescrolloff = 5                         -- big scrolloff to keep the search results centered
--opt.syntax = on
opt.hlsearch = true
opt.cursorline = true
--opt.colorcolumn = '80'
opt.laststatus=2
--opt.statusline=%.40F%=%y%4l\ \|\%-4L
opt.splitbelow = true
opt.splitright = true
opt.clipboard = 'unnamedplus'                 -- auto copy/paste from Vim to system clipboard
opt.undofile = true
vim.g.undodir = '$XDG_DATA_HOME/.config/nvim/undo_dir//'
opt.textwidth=119
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth=4
opt.softtabstop=4
opt.tabstop=4                                  -- number of spaces tabs count for
opt.shiftround = true                          -- round indent
opt.autoread = true                            -- auto read file when it was modified outside of vim
opt.autowriteall = true                        -- automatically write file when leaving modified buffer
vim.g.directory = "$XDG_DATA_HOME/nvim/swap//" -- dir for swap files

opt.hidden = true                              -- enable background buffers (files)
opt.joinspaces = false                         -- no double spaces with join
opt.list = true                                -- show some invisible characters
-- opt.listchars = { 'tab:>', 'trail:-' }         -- TODO: fix
opt.termguicolors = true                       -- true color support
opt.mouse = 'a'                                 -- TODO: making copy/paste to work over ssh terminals (better select txt for copy)


opt.foldlevel=99
opt.foldlevelstart=10

opt.fileencoding='cp1251'
opt.fileencodings='ucs-bom, utf-8, cp1251'
