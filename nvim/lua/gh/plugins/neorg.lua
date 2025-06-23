return {
  "nvim-neorg/neorg",
  version = "*",
  lazy = false,

  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- adds prety icons to your documents
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.syntax"] = {}, -- uses for code blocks
        ["core.dirman"] = { -- manage Neorg  workspaces
          config = {
            workspaces = {
              notes = "~/Documents/Repos/WikiNeorg",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,

  run = ":Neorg sync-parsers",
}
