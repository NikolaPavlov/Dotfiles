-----------------------------------------------------------
-- LINKS
-----------------------------------------------------------
-- http://vimcasts.org/
-- http://vimawesome.com/
-- http://learnvimscriptthehardway.stevelosh.com/
-- https://vim.fandom.com/wiki/Category:VimTip ---> VimTips
-- https://www.chrisatmachine.com/Neovim/27-native-lsp/
--
-- https://neovimcraft.com/
------------------------------------------------------------

-- norg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
--


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-startify'                  -- start screen with bookmarks

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
  use 'junegunn/gv.vim'                     -- git commit browser
  use 'mhinz/vim-signify'                   -- git diff in left bar
  use 'yuttie/comfortable-motion.vim'       -- scroll effect

  -- Themes and color
  use 'morhetz/gruvbox'
  use 'sjl/badwolf'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'lfv89/vim-interestingwords'      -- colorize interesting words with <leader>k
  use 'Yggdroot/indentLine'             -- showing indent lines


  -- Other
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup({
    create_mappings = false
  })
  use 'jiangmiao/auto-pairs'            -- match quotes, brackets, parenthesis
  use 'dm1try/golden_size'              -- auto resize splits
  use 'junegunn/vim-slash'              -- improve highlight search (blinking currsor)
  use 'machakann/vim-highlightedyank'

  -- use 'gu-fan/riv.vim'                  -- note taking in .rst
  -- gu-fan/InstantRst

  -- Shits
  -------------------------------------------------------------------------
  -- TODO: setup https://alpha2phi.medium.com/new-neovim-plugins-you-should-try-18aac675f595
  use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.autocommands"] = {}, --  a module for wrapping events around autocommands
                ["core.keybinds"] = {}, --  a module for binding events to keybinds
                ["core.highlights"] = {}, --  manages Neorg highlight groups and their colours
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                -- ["core.norg.completion"] = {
                --     config = {
                --         engine = 'nvim-cmp',
                --     },
                -- },
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/Documents/Repos/Wiki/NEORG",
                            autodetect = true,
                            autochdir = true,
                        }
                    }
                }
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use 'plasticboy/vim-markdown'

  -- TODO: https://github.com/michaelb/sniprun
  -------------------------------------------------------------------------

  if packer_bootstrap then
    require('packer').sync()
  end

end,

config = {
  display = {
    open_fn = require('packer.util').float,
  }
}

})
