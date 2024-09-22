return {
  "olimorris/persisted.nvim",
  lazy = false, -- make sure the plugin is always loaded at startup
  config = true,
  -- # TODO: higher priority in lazy
  autostart = true,
  autoload = true,
  save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Resolves to ~/.local/share/nvim/sessions/
}


-- require("persisted").setup({
--   autoload = true,
--   on_autoload_no_session = function()
--     vim.notify("No existing session to load.")
--   end
-- })

