# TODO use :telescope lsp_document_symbols
-- # TODO map for only open buffers with telescope with options {sort_mru} or {sort_lastused}
-- # TODO https://www.reddit.com/r/neovim/comments/17bt08g/how_do_you_guys_navigate_open_buffers/
-- # TODO https://github.com/danielfalk/smart-open.nvim


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
        pickers = {
          find_files = {
            hidden = true
          },
          current_buffer_fuzzy_find = {
            previewer = false,
          },
          buffers = {
            previewer = false,
            layout_config = { width = 0.5, height = 0.6 }
            -- # TODO: shorten the filenames ( only filenames )
          },
          live_grep = {
            disable_coordinates=true,
            -- file_encoding = cp1251, -- TODO
            additional_args = {
              "--fixed-strings",
            }
          }
        };
      })

      -- Enable Telescope extensions if they are installed
      -- TODO: "AckslD/nvim-neoclip.lua" | add as telescope extension
      -- pcall(require("telescope").load_extension, "fzf")
      -- pcall(require("telescope").load_extension, "ui-select")
      -- require("telescope").load_extension("persisted")
      require("telescope").load_extension("zoxide")


      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>b",  builtin.buffers)
      -- vim.keymap.set("n", "<leader>f",  builtin.git_files, { desc = "Search [F]iles" })
      vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Search [F]iles" })
      vim.keymap.set("n", "<leader>sb", builtin.git_branches, { desc = "Search [G]it [B]ranches" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>m", builtin.marks, { desc = "[S]earch [M]arks" })
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

      vim.keymap.set("n", "<C-w>", function()
        builtin.find_files({ cwd = "~/Documents/Repos/WikiNeorg/" })
      end, { desc = "Search [W]iki" })

      -- TODO
      -- TODO conflict with <C-h> for move
      -- vim.keymap.set("n", "<C-h>", function()
      --   builtin.find_files({ cwd = "~" })
      -- end, { desc = "Search [H]ome" })

      vim.keymap.set("n", "<leader>l", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[l] Fuzzily search in current buffer" })

      function live_grep_git_dir()
        local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
        git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
        local opts = {
          cwd = git_dir,
        }
        require('telescope.builtin').live_grep(opts)
      end
      vim.keymap.set("n", "<leader>r", ":lua live_grep_git_dir()<CR>")
    end,
  },
}
