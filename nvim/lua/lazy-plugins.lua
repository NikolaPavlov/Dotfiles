-------------------------------------------------------------------------------
-- TODO: luasnip / luasnip-snippets
-- TODO: 'nvim-spectre' -- search and replace
-- TODO: "lukas-reineke/lsp-format.nvim
-- TODO: setup perlnavigator
-- TODO: https://github.com/folke/trouble.nvim
-------------------------------------------------------------------------------

require("lazy").setup({
	require("gh/plugins/gitsigns"),
	require("gh/plugins/telescope"),
	require("gh/plugins/lspconfig"),
	-- require("gh/plugins/conform"),
	require("gh/plugins/cmp"),
	require("gh/plugins/tokyonight"),
	require("gh/plugins/badwolf"),
	require("gh/plugins/lualine"),
	require("gh/plugins/todo-comments"),
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	require("gh/plugins/mini"),
	require("gh/plugins/treesitter"),
	-- require 'ghr/lugins/debug',
	-- require("gh/plugins/indent_line"),
	-- require 'gh/plugins/lint',
	require("gh/plugins/autopairs"),
	require("gh/plugins/nerdtree"),
	require("gh/plugins/neo-tree"),
	require("gh/plugins/harpoon"),
	require("gh/plugins/noice"),
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	-- require("gh/plugins/neorg"),
	require("gh/plugins/vim-rest-console"),
	require("gh/plugins/oil"),
	require("gh/plugins/leap"),

	require("gh/plugins/startify"),
	-- "mhinz/vim-startify"

	"Valloric/MatchTagAlways", -- highlight matching html tags
	"dm1try/golden_size", -- auto resize splits
	-- "DanilaMihailov/beacon.nvim", -- cursor highlight
	"szw/vim-maximizer",
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
