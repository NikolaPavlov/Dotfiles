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
  -- require("gh/plugins/vim-airline"),
  -- require("gh/plugins/todo-comments"),
  require("gh/plugins/mini"),
  require("gh/plugins/treesitter"),
  require("gh/plugins/nerdtree"),
  -- require("gh/plugins/noice"),
  require("gh/plugins/oil"),
  require("gh/plugins/comment"),
  -- require("gh/plugins/indent"),
  require("gh/plugins/nvim-neoclip"),
  -- require("gh/plugins/harpoon"),
  -- require("gh/plugins/faster"),
  -- require("gh/plugins/harpoon"),
  require("gh/plugins/flash"),
  require("gh/plugins/snacks"),
  "dm1try/golden_size", -- auto resize splits
  "szw/vim-maximizer",
  "tpope/vim-fugitive",
  -- "tpope/vim-surround", -- change surroundings -- # TODO replace with mini
  "tpope/vim-repeat", -- repeat plugin commands
  "tpope/vim-unimpaired", -- git mappings
  "christoomey/vim-tmux-navigator",
  -- "mbbill/undotree",
  "ervandew/supertab",
  -- "godlygeek/tabular",
  -- 'lfv89/vim-interestingwords',

  -- "nvim-pack/nvim-spectre",
  -- "RishabhRD/nvim-cheat.sh", -- provide :Cheat and :CheaList commmand
  -- "RishabhRD/popfix",
  -- require("gh/plugins/vim-rest-console"),
  -- require("gh/plugins/neorg"),
  -- require 'gh/plugins/debug',
  -- require("gh/plugins/conform"),     # formater
  -- require 'gh/plugins/lint',
  -- "ThePrimeagen/vim-be-good",
  -- "Ramilito/winbar.nvim",

  -- "nvim-telescope/telescope-file-browser.nvim",
  -- "jvgrootveld/telescope-zoxide",
}, {
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
