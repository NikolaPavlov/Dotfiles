return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			keymaps_help = {
				border = "rounded",
				-- Configuration for the floating window in oil.open_float
				--
				float = {
					-- Padding around the floating window
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
			},
		})
	end,
}
