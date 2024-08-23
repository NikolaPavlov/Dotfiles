return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			require("telescope").setup({
				defaults = {
					-- mappings = {
					-- 	i = { ["<c-enter>"] = "to_fuzzy_refine" },
					-- },
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
				},
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "harpoon")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>r", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>g", builtin.git_files, { desc = "[S]earch by Git files" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[S]earch by Git files" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
			vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			-- TODO: builtin.lsp_document_symbols
			-- TODO: code actions

      vim.keymap.set("n", "<leader>sc", function()
        builtin.find_files({ cwd = "/mnt/core/home/n.pavlov/easypay_core/CORE/" })
      end, { desc = "[S]earch [N]eovim files" })

      vim.keymap.set("n", "<leader>sw", function()
        builtin.find_files({ cwd = "/mnt/web/home/n.pavlov/easypay_web/WEB/" })
      end, { desc = "[S]earch [N]eovim files" })

      vim.keymap.set("n", "<leader>v", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })

			vim.keymap.set("n", "<leader>l", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[l] Fuzzily search in current buffer" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
