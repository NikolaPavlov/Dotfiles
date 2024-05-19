-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.g.have_nerd_font = true

require("options")
require("keymaps")
require("abbreviations")
require("lazy-bootstrap")
require("lazy-plugins")

require("autocommands")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
