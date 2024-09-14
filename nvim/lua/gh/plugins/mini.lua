return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      require("mini.animate").setup()
      require("mini.bracketed").setup()
      require("mini.bufremove").setup()
      require("mini.cursorword").setup()
      require("mini.icons").setup()
      require("mini.jump").setup()
      require("mini.notify").setup()
      require("mini.pairs").setup()
      require("mini.tabline").setup()
      require("mini.trailspace").setup()
      require("mini.icons").setup()
      -- require("mini.completion").setup()
      -- require("mini.move").setup()
      -- require("mini.visits").setup()
      require("mini.sessions").setup({
        -- autoread = true,
        autowrite = true,
      })

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

      require('mini.bufremove').setup({

      })
      -- `MiniBufremove.delete`({buf_id}, {force})
      -- `MiniBufremove.wipeout`({buf_id}, {force})

      -- MiniHipaterns
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}

-- vininm: ts=2 sts=2 sw=2 et
