-------------------------------------------------------------------------------
-- TODO: 'nvim-spectre' -- search and replace
-- TODO: "lukas-reineke/lsp-format.nvim
-- TODO: setup perlnavigator
-- TODO: https://github.com/folke/trouble.nvim
-------------------------------------------------------------------------------

require("lazy").setup({
  require("gh/plugins/kanagawa"),
  -- require("gh/plugins/tokyonight"),
  -- require("gh/plugins/badwolf"),

	require("gh/plugins/telescope"),
	require("gh/plugins/lspconfig"),
	require("gh/plugins/cmp"), -- + luasnip as dependency
	require("gh/plugins/lualine"),
	require("gh/plugins/todo-comments"),
  require("gh/plugins/mini"),
  require("gh/plugins/treesitter"),
  require("gh/plugins/autopairs"),
  require("gh/plugins/nerdtree"),
  require("gh/plugins/neo-tree"),
  require("gh/plugins/harpoon"),
  require("gh/plugins/noice"),
  require("gh/plugins/vim-rest-console"),
  require("gh/plugins/oil"),
  require("gh/plugins/leap"),
  -- require("gh/plugins/neorg"),
  -- require 'ghr/lugins/debug',
  -- require("gh/plugins/conform"),
  -- require("gh/plugins/indent_line"),
  -- require 'gh/plugins/lint',
  -- require("gh/plugins/startify"),
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	"Valloric/MatchTagAlways", -- highlight matching html tags
	"dm1try/golden_size", -- auto resize splits
	"szw/vim-maximizer",
  require("gh/plugins/gitsigns"),
	"tpope/vim-fugitive",
	"tpope/vim-surround", -- change surroundings
	"tpope/vim-repeat", -- repeat plugin commands
	"tpope/vim-unimpaired", -- git mappings
	"christoomey/vim-tmux-navigator",
	"mbbill/undotree",
	"nvim-pack/nvim-spectre",
	"RishabhRD/nvim-cheat.sh", -- provide :Cheat and :CheaList commmand
	"RishabhRD/popfix",

	"ThePrimeagen/vim-be-good",
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

local ft = require('Comment.ft')
ft.set('def', '#%s')

-- vim: ts=2 sts=2 sw=2 et
