return {
	{
		"mhinz/vim-startify",
		config = function()
			vim.cmd([[
        let g:startify_bookmarks = [ {'key1': '~/.vimrc1'}, {'key2': '~/.vimrc2'} ]
      ]])
		end,
	},
}
