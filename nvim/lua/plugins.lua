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
  use 'christoomey/vim-tmux-navigator'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- repeat plugin commands
  use 'junegunn/gv.vim'                     -- git commit browser
  --
  -------------------------------
  -- TODO: 
  -- vim-signify VS gitsigns
  use 'mhinz/vim-signify'                   -- git diff in left bar

  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }
  --
  -------------------------------
  use 'yuttie/comfortable-motion.vim'       -- scroll effect

  -- Themes and color
  use 'morhetz/gruvbox'
  use 'sjl/badwolf'
  use 'cocopon/iceberg.vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'lfv89/vim-interestingwords'      -- colorize interesting words with <leader>k
  -- TODO: https://github.com/inkarkat/vim-mark
  use 'Yggdroot/indentLine'             -- showing indent lines TODO: set listchars=tab:| as a replacement of the plugin
  use 'kshenoy/vim-signature'           -- display marks in the left panel
  use 'Valloric/MatchTagAlways'         -- highlight matching html tags
  -----------------------
  -- use 'jsfaint/gen_tags.vim'            -- tags management
  use 'ludovicchabant/vim-gutentags'    -- Automatic tags management
  -- TODO: go to multiple tags g] (chose one)
  -- TODO: https://vim.fandom.com/wiki/Browsing_programs_with_tags
  -- TODO: https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
  -----------------------

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        -- -LHS of toggle mappings in NORMAL + VISUAL mode
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL + VISUAL mode
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = 'gcA',
        },
      }
    end
  }
  use 'jiangmiao/auto-pairs'            -- match quotes, brackets, parenthesis
  use 'dm1try/golden_size'              -- auto resize splits
  use 'junegunn/vim-slash'              -- improve highlight search (blinking currsor)
  use 'ojroques/vim-oscyank'            -- copy through SSH
  use 'ThePrimeagen/harpoon'            -- fetch files for quick navigation


  ------------------------------------------------------
  -- install *.norg format for treesitter with :TSInstall norg
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }

    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/Documents/Repos/WikiNeorg"
                            }
                        }
                    }
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }
  ------------------------------------------------------
  -- Shits
  -------------------------------------------------------------------------
  use 'plasticboy/vim-markdown'
  use 'majutsushi/tagbar'            -- display tags with <T>
  use 'godlygeek/tabular'            -- text align
  use 'dbeniamine/cheat.sh-vim'      -- query cht.sh with :Cheat
  use 'airblade/vim-rooter'          -- autochange workdir (<leader>G / <leader>f as alternative ?)
  use 'folke/zen-mode.nvim'          -- focus mode
  use 'stsewd/fzf-checkout.vim'      -- change branches with FZF with <leader>b

  --  use 'gyim/vim-boxdraw'                        -- box drawing
  --  use 'vim-scripts/DrawItv'                     -- drawing
  -- TODO: mbbill/undotree
  -- TODO: try nvim-cmp https://www.youtube.com/watch?v=_DnmphIwnjo&t=12s
  -- use { 'michaelb/sniprun', run = 'bash ./install.sh'} -- code runner plugin (TODO: setup doesn't work)

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
