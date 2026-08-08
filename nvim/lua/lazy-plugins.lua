-------------------------------------------------------------------------------
-- TODO: "kevinhwang91/nvim-ufo"
-- TODO: 'nvim-spectre' -- search and replace
-- TODO: "lukas-reineke/lsp-format.nvim
-- TODO: setup perlnavigator
-- TODO: https://github.com/folke/trouble.nvim
-- TODO: https://github.com/nvim-telescope/telescope-frecency.nvim
-- TODO: https://github.com/kndndrj/nvim-dbee
-- TODO: "sindrets/diffview.nvim"
-------------------------------------------------------------------------------

require("lazy").setup({
  require("gh/plugins/colors/kanagawa"),
  require("gh/plugins/telescope"),
  require("gh/plugins/gitsigns"),
  require("gh/plugins/lspconfig"),
  require("gh/plugins/nvim-cmp"), -- + luasnip as dependency
  require("gh/plugins/lualine"),
  require("gh/plugins/mini"),
  require("gh/plugins/treesitter"),
  require("gh/plugins/oil"),
  require("gh/plugins/comment"),
  require("gh/plugins/nvim-neoclip"),
  require("gh/plugins/flash"),
  require("gh/plugins/snacks"),
  -- require("gh/plugins/neorg"),


  { "dm1try/golden_size", event = "VeryLazy" },
  { "szw/vim-maximizer", event = "VeryLazy" },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  -- "tpope/vim-surround", -- # TODO replace with mini
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-unimpaired", event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  { "mbbill/undotree", event = "VeryLazy" },
  { "godlygeek/tabular", event = "VeryLazy" },
  { "lfv89/vim-interestingwords", event = "VeryLazy" },
}, {
    defaults = { lazy = true },
    ui = {
      icons = vim.g.have_nerd_font and {} or {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        require = "🌙",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  })

local ft = require('Comment.ft')
ft.set('def', '#%s')
