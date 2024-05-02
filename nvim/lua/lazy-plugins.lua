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
	-------------------------------------------------------------------------------

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plegins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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
