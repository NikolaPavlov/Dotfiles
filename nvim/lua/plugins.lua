local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-startify'

  -- Completion
  -- use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/nvim-compe'
  use 'shougo/deoplete.nvim'
  use 'shougo/deoplete-lsp'
  use 'shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'

  -- Navigation
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'              -- icons in nerdtree

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- repeat surround commands
  use 'https://github.com/junegunn/gv.vim'  -- git commit browser
  use 'mhinz/vim-signify'                   -- git diff in left bar

  -- Themes
  use 'morhetz/gruvbox'
  use 'sjl/badwolf'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nvim-treesitter/nvim-treesitter'

  -- Other
  use 'Yggdroot/indentLine'             -- showing indent lines
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup({
    create_mappings = false
  })
  use 'jiangmiao/auto-pairs'            -- match quotes, brackets, parenthesis
  use 'dm1try/golden_size'              -- auto resize splits
  use 'jose-elias-alvarez/buftabline.nvim'
  require("buftabline").setup {}
  use 'junegunn/vim-slash'              -- improve highlight search (blinking currsor)
  use 'machakann/vim-highlightedyank'
  use 'gu-fan/riv.vim'                  -- note taking in .rst

  if packer_bootstrap then
    require('packer').sync()
  end
end)
