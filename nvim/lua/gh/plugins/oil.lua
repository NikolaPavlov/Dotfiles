return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			float = {
				padding = 2,
				max_width = 60,
				max_height = 20,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			keymaps = {
				["<leader>o"] = "actions.close",
			},
		})
	end,
}
