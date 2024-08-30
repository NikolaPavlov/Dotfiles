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
      require("mini.tabline").setup()
      require("mini.icons").setup()
      require("mini.trailspace").setup()
      -- require("mini.visits").setup()
      require("mini.sessions").setup()

      local starter = require('mini.starter')
      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(10, false),
          starter.sections.recent_files(10, true),
          -- Use this if you set up 'mini.sessions'
          starter.sections.sessions(5, true)
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('all', { 'Builtin actions' }),
          starter.gen_hook.padding(3, 2),
        },
      })

    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
