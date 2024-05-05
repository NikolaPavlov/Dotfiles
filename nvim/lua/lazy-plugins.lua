-------------------------------------------------------------------------------
-- TODO: center oil screen
-- TODO: vim-rest-console
-- TODO: neogit
-- TODO: 'lazy-git'
-- TODO: 'nvim-spectre' -- search and replace
-- TODO: 'auto-session'
-- TODO: 'nvim-lualine/lualine.nvim'
-- TODO: nvim-telescope/telescope-frecency.nvim
-- TODO: leap.nvim
-- TODO: "lukas-reineke/lsp-format.nvim
-------------------------------------------------------------------------------

require("lazy").setup({
	{ "numToStr/Comment.nvim", opts = {} },
	require("kickstart/plugins/gitsigns"),
	require("kickstart/plugins/telescope"),
	require("kickstart/plugins/lspconfig"),
	require("kickstart/plugins/conform"),
	require("kickstart/plugins/cmp"),
	require("kickstart/plugins/tokyonight"),
	require("kickstart/plugins/todo-comments"),
	require("kickstart/plugins/mini"),
	require("kickstart/plugins/treesitter"),
	-- require 'kickstart.plugins.debug',
	require("kickstart.plugins.indent_line"),
	-- require 'kickstart.plugins.lint',
	require("kickstart.plugins.autopairs"),
	require("kickstart.plugins.neo-tree"),
	require("kickstart.plugins.harpoon"),
	require("kickstart.plugins.noice"),
	require("kickstart.plugins.neorg"),
	require("kickstart.plugins.vim-rest-console"),
	require("kickstart.plugins.oil"),
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	"mhinz/vim-startify", -- start screen with bookmarks
	"Valloric/MatchTagAlways", -- highlight matching html tags
	"dm1try/golden_size", -- auto resize splits
	"DanilaMihailov/beacon.nvim", -- cursor highlight
	"szw/vim-maximizer",
	"tpope/vim-fugitive",
	"tpope/vim-surround", -- change surroundings
	"tpope/vim-repeat", -- repeat plugin commands
	"tpope/vim-unimpaired", -- git mappings
	"christoomey/vim-tmux-navigator",
	"mbbill/undotree",

	-- provide :Cheat and :CheaList commmand
	"RishabhRD/nvim-cheat.sh",
	"RishabhRD/popfix",
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

-- vim: ts=2 sts=2 sw=2 et
