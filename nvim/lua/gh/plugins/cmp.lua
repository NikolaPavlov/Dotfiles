return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",

		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					return "make install_jsregexp"
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
      "hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
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
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				},
			})
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
