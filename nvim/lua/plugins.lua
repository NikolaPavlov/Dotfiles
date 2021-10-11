local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-startify'

  use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/nvim-compe'

  use 'shougo/deoplete.nvim'
  use 'shougo/deoplete-lsp'
  use 'shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

--------------------------

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'mhinz/vim-signify'
  use 'scrooloose/nerdtree'
  use 'Yggdroot/indentLine'
  -- use 'tomtom/tcomment_vim'
  -----
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup({
    create_mappings = false
  })
  -----
  use 'jiangmiao/auto-pairs'
  use 'dm1try/golden_size'
--  use 'ap/vim-buftabline'
  use 'jose-elias-alvarez/buftabline.nvim'

  use 'junegunn/vim-slash'
  use 'machakann/vim-highlightedyank'

  use 'morhetz/gruvbox'
  use 'sjl/badwolf'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  if packer_bootstrap then
    require('packer').sync()
  end
end)


