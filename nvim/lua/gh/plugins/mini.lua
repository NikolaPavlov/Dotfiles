return {
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      require("mini.animate").setup()
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      -- require("mini.completion").setup()
      require("mini.cursorword").setup()
      require("mini.icons").setup()
      require("mini.jump").setup()
      require("mini.jump2d").setup() -- # TODO:  <enter> trigger
      -- require("mini.move").setup()
      require("mini.notify").setup()
      require("mini.pairs").setup()
      require("mini.starter").setup() -- # TODO:  replace Startify
      require("mini.tabline").setup()
      require("mini.icons").setup()
      require("mini.trailspace").setup()
      -- require("mini.visits").setup()
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
