return {
  {
    "mhinz/vim-startify",
    config = function()
      vim.cmd([[
        let g:startify_bookmarks = [ {'W': '/mnt/web/home/n.pavlov/easypay_web/WEB '}, {'C': '/mnt/core/home/n.pavlov/easypay_core/CORE/ '} ]
        ]])
    end,
  },
}
