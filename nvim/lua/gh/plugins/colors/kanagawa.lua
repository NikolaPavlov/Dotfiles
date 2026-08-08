return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false, -- colorscheme must load at startup
    init = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
