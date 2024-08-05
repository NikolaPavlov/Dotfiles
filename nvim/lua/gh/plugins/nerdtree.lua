return {
	"preservim/nerdtree",
	config = function()
		vim.cmd([[
      autocmd FileType nerdtree setlocal relativenumber
      let NERDTreeAutoDeleteBuffer = 1
      let NERDTreeBookmarksSort = 0
      let NERDTreeDirArrows = 1
      let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
      let NERDTreeMinimalUI = 1
      let NERDTreeQuitOnOpen = 0
      let NERDTreeShowBookmarks = 1  " Display bookmarks on startup.
      let NERDTreeShowLineNumbers = 1
    ]])
		vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })
	end,
}
