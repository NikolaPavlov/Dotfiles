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
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
        },
        -- pickers = {}
        pickers = {
              current_buffer_fuzzy_find = {
                previewer = false,
              },
              buffers = {
                previewer = false,
                layout_config = { width = 0.5, height = 0.6 }
                -- # TODO: shorten the filenames
              }
        };
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          -- persisted = {
          --   layout_config = { width = 0.50, height = 0.50 }
          -- }
        },
      })

      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "harpoon")
      pcall(require("telescope").load_extension, "ui-select")
      -- require("telescope").load_extension("persisted")

      local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<leader>r",  builtin.live_grep, { desc = "Search by [G]rep" })
      vim.keymap.set("n", "<leader>b",  builtin.buffers)
      -- vim.keymap.set("n", "<leader>f",  builtin.find_files, { desc = "Search [F]iles" })
      vim.keymap.set("n", "<leader>f",  builtin.git_files, { desc = "Search [F]iles" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search [F]iles" })
      vim.keymap.set("n", "<leader>sb", builtin.git_branches, { desc = "Search [G]it [B]ranches" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
      vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- TODO: builtin.lsp_document_symbols
      -- TODO: code actions

      vim.keymap.set("n", "<leader>c", function()
        builtin.find_files({ cwd = "/mnt/core/home/n.pavlov/easypay_core/CORE/" })
      end, { desc = "Search [C]ore" })

      vim.keymap.set("n", "<leader>w", function()
        builtin.find_files({ cwd = "/mnt/web/home/n.pavlov/easypay_web/WEB/" })
      end, { desc = "Search [W]eb" })

      vim.keymap.set("n", "<leader>v", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "Search Neo[V]im files" })

      vim.keymap.set("n", "<leader>el", function()
        builtin.find_files({ cwd = "/mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/" })
      end, { desc = "Search Logs" })

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
