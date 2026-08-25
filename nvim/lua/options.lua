local opt = vim.opt

-- Detect SSH session
local is_ssh = vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil or vim.env.SSH_TTY ~= nil
vim.g.is_ssh = is_ssh

opt.incsearch = true
opt.showmatch = false -- disabled for speed: prevents cursor jump latency when typing brackets over SSH
opt.ignorecase = true
opt.smartcase = true -- do not ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.wrap = true -- line wraps
opt.linebreak = true
opt.showbreak = "  "
opt.breakindent = true

-- Line numbers: absolute on SSH to avoid transmitting 50+ lines of diffs per cursor movement
opt.number = true
opt.relativenumber = not is_ssh

opt.scrolloff = 8
opt.sidescrolloff = 5

-- Cursorline: highlight the current line
opt.cursorline = true
opt.lazyredraw = true -- do not redraw while running macros/registers

opt.laststatus = 2
opt.splitbelow = true
opt.splitright = true

-- Note: We avoid `unnamedplus` over SSH because syncing on every single `d`/`x`/`c`
-- floods the SSH socket with OSC 52 sequences. Use `<leader>y` or `"+y` to explicitly sync clipboard.
-- If not on SSH, you can still use unnamedplus if desired.
if not is_ssh then
  opt.clipboard:append("unnamedplus")
end
-- Store swap, backup, and undo files locally instead of on the mount
local state_dir = vim.fn.expand("~/.local/state/nvim/")
vim.opt.backupdir = state_dir .. "backup//"
vim.opt.directory = state_dir .. "swap//"
vim.opt.undodir = state_dir .. "undo//"
vim.opt.undofile = true
vim.opt.swapfile = true

opt.textwidth = 119
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4 -- number of spaces tabs count for
opt.shiftround = true -- round indent
opt.autoread = true -- auto read file when it was modified outside of vim
opt.autowriteall = true -- automatically write file when leaving modified buffer
opt.updatetime = is_ssh and 500 or 300 -- larger debounce on SSH to avoid frequent background triggers
opt.timeoutlen = 400
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

-- Fast folding: avoid 'indent' / 'syntax' foldmethods which recalculate on EVERY insert mode keystroke
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "manual"

-- opt.fileencoding = "cp1251"
opt.fileencodings = "ucs-bom,utf-8,cp1251"
opt.helpheight = 999999
opt.synmaxcol = 200 -- max column for syntax highlight
opt.redrawtime = 1500
opt.autochdir = false

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

-- OSC 52 system clipboard provider
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
