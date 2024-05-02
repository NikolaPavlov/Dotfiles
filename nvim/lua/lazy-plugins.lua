-------------------------------------------------------------------------------
-- TODO: undotree
-- TODO: 'lazy-git'
-- TODO: 'kickstart.plugins.ufo', -- comments plugin
-- TODO: 'nvim-spectre' -- search and replace
-- TODO: 'auto-session'
-- TODO: 'nvim-lualine/lualine.nvim'
-- TODO: setup cheat.sh
-- TODO: nvim-telescope/telescope-frecency.nvim
-- TODO: harpoon
-- TODO: leap.nvim
-------------------------------------------------------------------------------

require("lazy").setup({
	{ "numToStr/Comment.nvim", opts = {} },
	require("kickstart/plugins/gitsigns"),
	-- require 'kickstart/plugins/which-key',
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
	"mhinz/vim-startify", -- start screen with bookmarks
	"ryanoasis/vim-devicons", -- icons in nerdtree
	"Valloric/MatchTagAlways", -- highlight matching html tags
	"dm1try/golden_size", -- auto resize splits
	"DanilaMihailov/beacon.nvim", -- cursor highlight
	{ "stevearc/oil.nvim", opts = {} },
	"szw/vim-maximizer",
	"tpope/vim-fugitive",
	"tpope/vim-surround", -- change surroundings
	"tpope/vim-repeat", -- repeat plugin commands
	"tpope/vim-unimpaired", -- git mappings
	"christoomey/vim-tmux-navigator",
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
