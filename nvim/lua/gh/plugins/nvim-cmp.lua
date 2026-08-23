return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          if vim.fn.executable("make") == 1 then
            return "make install_jsregexp"
          end
        end)(),
        dependencies = {
          -- {
          -- 	"rafamadriz/friendly-snippets",
          -- 	config = function()
          -- 		require("luasnip.loaders.from_vscode").lazy_load()
          -- 	end,
          -- },
          {
            "honza/vim-snippets",
            config = function()
              require("luasnip.loaders.from_snipmate").lazy_load()
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        performance = {
          debounce = 60,
          throttle = 30,
          fetching_timeout = 200,
          confirm_resolve_timeout = 80,
          async_budget = 1,
          max_view_entries = 15,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert({
          ["<C-l>"] = cmp.mapping.select_next_item(),
          ["<C-h>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
          -- ["<C-n>"] = cmp.mapping.select_next_item(),
          -- ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          ["<C-j>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-k>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp", max_item_count = 20 },
          { name = "luasnip", max_item_count = 10 },
          { name = "path", max_item_count = 5 },
          {
            name = "buffer",
            keyword_length = 3,
            max_item_count = 5,
            option = {
              get_bufnrs = function()
                -- Only index visible buffers, not all loaded buffers
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
