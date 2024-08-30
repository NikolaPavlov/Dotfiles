local opt = vim.opt

opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true -- do not ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.wrap = true -- disable line wraps
opt.linebreak = true
opt.showbreak = "  "
opt.breakindent = true
-- opt.lazyredraw = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.cursorline = true
opt.laststatus = 2
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus" -- auto copy/paste from Vim to system clipboard
opt.undofile = true
vim.g.undodir = "$XDG_DATA_HOME/.config/nvim/undo_dir//"
opt.textwidth = 119
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4 -- number of spaces tabs count for
opt.shiftround = true -- round indent
opt.autoread = true -- auto read file when it was modified outside of vim
opt.autowriteall = true -- automatically write file when leaving modified buffer
opt.swapfile = false

opt.updatetime = 300
opt.timeoutlen = 500

opt.hidden = true -- enable background buffers (files)
opt.joinspaces = false -- no double spaces with join
opt.list = true -- show some invisible characters
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"

opt.termguicolors = true -- true color support
opt.mouse = "a" -- enable mouse (for resize splits)
opt.showmode = false
opt.guicursor = "" -- keep cursor as block in insert mode
opt.signcolumn = "yes"

opt.foldlevel = 99
opt.foldlevelstart = 10
opt.foldmethod = "indent"

opt.fileencoding = "cp1251"
opt.fileencodings = "ucs-bom, utf-8, cp1251"

opt.helpheight = 999999

-- Theme settings
-- vim.g.badwolf_darkgutter = 1 -- dark background for the relativenumbers
-- vim.g.badwolf_html_link_underline = 0

-- Other
opt.synmaxcol = 240 -- max column for syntax highlight

-- disable builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- # TODO: super slow
-- # TODO: force to use OSC52
-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--   },
-- }

-- vim: ts=2 sts=2 sw=2 et
