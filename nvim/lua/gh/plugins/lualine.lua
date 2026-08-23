return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "powerline_dark",
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
    })
  end,
}
