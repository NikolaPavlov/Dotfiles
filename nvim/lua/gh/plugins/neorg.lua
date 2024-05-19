return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	version = "*",

	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {}, -- adds prety icons to your documents
				["core.dirman"] = { -- manage Neorg  workspaces
					config = {
						workspaces = {
							notes = "~/Documents/Repos/WikiNeorg",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,

	run = ":Neorg sync-parsers",
}
