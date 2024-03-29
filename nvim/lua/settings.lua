local opt = vim.opt
local cmd = vim.cmd            -- exec vim commands
local exec = vim.api.nvim_exec -- exec Vimscript
local g=vim.g                  -- global variable
local fn= vim.fn               -- call Vim functions


----------------------------
vim.o.termguicolors = true
-- vim.cmd'colorscheme iceberg'

cmd 'colorscheme badwolf'
-- cmd 'colorscheme gruvbox'
-- cmd 'colorscheme iceberg'
opt.termguicolors = true
----------------------------


opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true                            -- do not ignore case with capitals
opt.smartindent = true                          -- insert indents automatically
opt.wrap = true                                -- disable line wraps
opt.linebreak = true
opt.showbreak = '  '
opt.lazyredraw = true
opt.relativenumber = true
opt.scrolloff = 999                             -- big scrolloff to keep the search results centered
opt.sidescrolloff = 5                         -- big scrolloff to keep the search results centered
opt.cursorline = true
--opt.colorcolumn = '80'
opt.laststatus=2
--opt.statusline=%.40F%=%y%4l\ \|\%-4L
opt.splitbelow = true
opt.splitright = true
opt.clipboard = 'unnamedplus'                 -- auto copy/paste from Vim to system clipboard
-- opt.clipboard = "unnamed,unnamedplus"      -- TODO:
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
-- vim.g.directory = "$XDG_DATA_HOME/nvim/swap//" -- dir for swap files
opt.swapfile = false

opt.hidden = true                              -- enable background buffers (files)
opt.joinspaces = false                         -- no double spaces with join
opt.list = true                                -- show some invisible characters
opt.listchars = { tab = ':> ', trail = '' }

opt.termguicolors = true                       -- true color support
opt.mouse = 'a'                                -- enable mouse (for resize splits)
opt.showmode = false
opt.guicursor=''                                -- keep cursor as block in insert mode


opt.foldlevel=99
opt.foldlevelstart=10

opt.fileencoding='cp1251'
opt.fileencodings='ucs-bom, utf-8, cp1251'


-- Theme settings
vim.g.badwolf_darkgutter = 1                    -- dark background for the relativenumbers
vim.g.badwolf_html_link_underline = 0

-- Other
opt.synmaxcol = 240                             -- max column for syntax highlight

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
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

