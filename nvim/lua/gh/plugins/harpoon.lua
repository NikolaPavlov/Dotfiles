return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		local function map(lhs, rhs, opts)
			vim.keymap.set("n", lhs, rhs, opts or {})
		end
		map("<leader>ha", function()
			harpoon:list():append()
		end)
		map("<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		map("<leader>1", function()
			harpoon:list():select(1)
		end)
		map("<leader>2", function()
			harpoon:list():select(2)
		end)
		map("<leader>3", function()
			harpoon:list():select(3)
		end)
		map("<leader>4", function()
			harpoon:list():select(4)
		end)
	end,
}
