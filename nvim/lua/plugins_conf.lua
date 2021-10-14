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
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    " * enable/disable displaying open splits per tab (only when tabs are opened) >
    " let g:airline#extensions#tabline#show_splits = 1
    " * enable/disable displaying buffers with a single tab. (c) >
    let g:airline#extensions#tabline#show_buffers = 1
    " * enable/disable displaying number of tabs in the right side (c) >
    let g:airline#extensions#tabline#show_tab_count = 0
    " * enable/disable display preview window buffer in the tabline. >
    let g:airline#extensions#tabline#exclude_preview = 0
    " * enable/disable displaying tab number in tabs mode. >
    let g:airline#extensions#tabline#show_tab_nr = 0
    " * always show current tabpage/buffer first >
    let airline#extensions#tabline#current_first = 0
    " * configure whether buffer numbers should be shown. >
    let g:airline#extensions#tabline#fnamemod = ':p:.'
    " * configure truncating non-active buffer names to specified length. >
    let g:airline#extensions#tabline#fnametruncate = 0
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#tabline#fnametruncate = 8
    " * configure separators for the tabline only. >
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ' '
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ' '
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
map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>g', ':GFiles<CR>')
map('n', '<leader>h', ':Helptags!<CR>')
map('n', '<leader>l', ':Lines<CR>')
map('n', '<leader>r', ':Rg<CR>')
map('n', '<leader>t', ':Tags<CR>')
-- TODO: add keybinding for specific folders
map('n', '<leader>v', ':Files ~/Documents/Repos/Dotfiles/nvim/lua<CR>')
map('n', '<leader>p', ':Files /mnt/core/home/n.pavlov/easypay_core/CORE<CR>')
map('n', '<leader>el', ':Files /mnt/core/usr/local/remedy2/VAR/CORE/easypay_n.pavlov_31104/log/<CR>')

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

--
-- Signify
cmd [[
    nmap <leader>gj <plug>(signify-next-hunk)
    nmap <leader>gk <plug>(signify-prev-hunk)
    nmap <leader>gJ 9999<leader>gj
    nmap <leader>gK 9999<leader>gk
]]








--
-- Other

--
-- When editing a file always jump to the last known location
cmd [[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

-- auto recompile packer
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]