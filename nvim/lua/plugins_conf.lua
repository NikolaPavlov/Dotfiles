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
-- FZF
map('n', '<leader>g', ':GFiles<CR>')
map('n', '<leader>f', ':Files<CR>')
map('n', '<leader>l', ':Lines<CR>')
map('n', '<leader>t', ':Tags<CR>')
map('n', '<leader>r', ':Rg<CR>')
map('n', '<leader>h', ':Helptags!<CR>')

vim.cmd [[
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_buffers_jump = 1
]]


--
-- TComment
map('n', '<leader>c', ':TComment<CR>')
