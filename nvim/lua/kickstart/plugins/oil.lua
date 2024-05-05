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
			float = {
				padding = 2,
				max_width = 150,
				max_height = 30,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
		})
	end,
}
