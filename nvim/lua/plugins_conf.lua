local cmd = vim.cmd

local function map(mode, lhs, rhs, opts) local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- AirLine
vim.cmd [[
    let g:airline_theme='minimalist'
    let g:airline_powerline_fonts = 1
    let g:airline_section_a = ''
    let g:airline_section_x = ''
    let g:airline_section_z = "%l/%L:%p%%"
    let g:airline_skip_empty_sections = 1
    let g:airline_inactive_collapse=1

    let g:airline_extensions = ['branch', 'tabline']
    let g:airline#extensions#branch#enabled = 1    
]]


--
-- Deoplete
cmd [[
  let g:deoplete#enable_at_startup = 1
  let g:AutoPairsMapCR=0
  
  call deoplete#custom#source('_', 'smart_case', v:true)

  imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
  imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
]]
-- vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? \"\\<C-n>\" : (neosnippet#expandable_or_jumpable() ? \"\\<Plug>(neosnippet_expand_or_jump)\" : \"\\<TAB>"', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? \"\\<C-p>\" : \"\\<S-TAB>\"', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<expr><TAB>', 'pumvisible() ? deoplete#mappings#close_popup() : \"\\<CR>\\<Plug>AutoPairsReturn\"', { noremap = true, silent = true })


--
-- FZF
map('n', '<leader>g', ':GFiles<CR>')
map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>l', ':Lines<CR>')
map('n', '<leader>t', ':Tags<CR>')
map('n', '<leader>r', ':Rg<CR>')
map('n', '<leader>h', ':Helptags!<CR>')

cmd [[
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_buffers_jump = 1
]]


--
-- NeoSnippet
cmd [[
    let g:neosnippet#snippets_directory="$HOME/Documents/Repos/Dotfiles/NeoSnippets"
]]


--
-- nVim-Comment
map('n', '<leader>c', ':CommentToggle<CR>')
map('v', '<leader>c', ':CommentToggle<CR>')


--
-- Buftabline
map('n', '<leader>-', ':ToggleBuftabline<CR>') -- remove tabline

--
-- NerdTree
cmd [[
    autocmd FileType nerdtree setlocal relativenumber
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeBookmarksSort = 0
    let NERDTreeDirArrows = 1
    let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']
    let NERDTreeMinimalUI = 1
    let NERDTreeQuitOnOpen = 0
    let NERDTreeShowBookmarks = 1  " Display bookmarks on startup.
    let NERDTreeShowLineNumbers = 1
]]
