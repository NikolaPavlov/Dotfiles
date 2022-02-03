local cmd = vim.cmd

local function map(mode, lhs, rhs, opts) local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- AirLine
cmd [[
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
-- FZF + fzf-checkout
    map('n', '<leader>f', ':Files<CR>')
    map('n', '<leader>g', ':GFiles<CR>')
    map('n', '<leader>h', ':Helptags!<CR>')
    map('n', '<leader>l', ':Lines<CR>')
    map('n', '<leader>r', ':Rg<CR>')
    map('n', '<leader>t', ':Tags<CR>')
    map('n', '<leader>b', ':GBranches<CR>')

    map('n', '<leader>F', ':Files ~<CR>')
    map('n', '<leader>v', ':Files ~/Documents/Repos/Dotfiles/nvim/lua<CR>')
    map('n', '<leader>p', ':Files /mnt/core/home/n.pavlov/easypay_core/CORE<CR>')
    cmd [[
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
        let $FZF_DEFAULT_OPTS='--layout=reverse'
        let g:fzf_buffers_jump = 1
    ]]

-- Rg search from the project root of the current buffe
-- https://github.com/junegunn/fzf.vim/issues/837
cmd [[
    command! -bang -nargs=* PRg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)
]]


--
-- NeoSnippet
cmd [[
    let g:neosnippet#snippets_directory="$HOME/Documents/Repos/Dotfiles/NeoSnippets"

    imap <C-j>     <Plug>(neosnippet_expand_or_jump)
    smap <C-j>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-j>     <Plug>(neosnippet_expand_target)
]]

-- nVim-Comment
-- map('n', '<leader>c', ':CommentToggle<CR>')
-- map('v', '<leader>c', ':CommentToggle<CR>')


--
-- Comment
local comment_ft = require "Comment.ft"
-- .def files comment string to be '#'
comment_ft.set("def", { '# %s', "-- [%s]" })



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
-- Harpoon
map('n', '<leader>A', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>H', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

--
-- Startify
cmd [[
    let g:startify_session_dir='~/.config/nvim/sessions'
    let g:startify_bookmarks = [ { 'b': '~/Documents/Repos/Dotfiles/.bashrc' }, { 'w': '~/Documents/Repos/WikiNeorg/index.norg' },{ 'd': '~/Documents/Repos/Dotfiles' }, ]
]]

--
-- TreeSitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    'python',
    'perl',
    'json',
    'html',
  },
}

--
-- GutenTags
cmd [[
  let g:gutentags_generate_on_new = 1
  let g:gutentags_generate_on_missing = 1
  let g:gutentags_generate_on_write = 1
  let g:gutentags_generate_on_empty_buffer = 0
  let g:gutentags_ctags_extra_args = [ '--tag-relative=yes', '--fields=+ailmnS' ]
]]

--
-- Lsp

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', }
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
