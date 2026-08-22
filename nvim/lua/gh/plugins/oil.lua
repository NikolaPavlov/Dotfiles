return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      float = {
        padding = 2,
        max_width = 85,
        max_height = 25,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ["<leader><CR>"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
