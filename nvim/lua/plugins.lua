local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup({function(use)
  -- https://github.com/DanilaMihailov/vim-tips-wiki
  use 'mhinz/vim-startify'                  -- start screen with bookmarks

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'               -- used by lua plugins

  -- Completion
  use 'shougo/deoplete.nvim'
  use 'shougo/deoplete-lsp'

  use 'shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'

  -- Navigation
  use 'scrooloose/nerdtree'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'ryanoasis/vim-devicons'              -- icons in nerdtree
  use 'christoomey/vim-tmux-navigator'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'                  -- change surroundings
  use 'tpope/vim-repeat'                    -- repeat plugin commands
  use 'tpope/vim-unimpaired'                      -- git mappings
  use 'junegunn/gv.vim'                     -- git commit browser

  use 'mhinz/vim-signify'                   -- git diff in left bar
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

  use 'Yggdroot/indentLine'             -- showing indent lines TODO: set listchars=tab:| as a replacement of the plugin
  use 'kshenoy/vim-signature'           -- display marks in the left panel
  use 'ludovicchabant/vim-gutentags'    -- Automatic tags management

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
  use 'Valloric/MatchTagAlways'         -- highlight matching html tags
  use 'jiangmiao/auto-pairs'            -- match quotes, brackets, parenthesis
  use 'dm1try/golden_size'              -- auto resize splits
  use 'ojroques/vim-oscyank'            -- copy through SSH
  use 'DanilaMihailov/beacon.nvim'      -- cursor highlight

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
        ft = "norg",
        run = ":Neorg sync-parsers",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.concealer"] = {}, -- Allows for use of icons
                    -- ["core.completion"] = {}, # TODO: add completion engine https://github.com/nvim-neorg/neorg/wiki/Completion
                    -- ["core.keybindings"] = {},
                    ["core.journal"] = {},
                    ["core.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                wiki = "~/Documents/Repos/WikiNeorg",
                                journal = "~/Documents/Repos/JournalNeorg"
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
  use 'moll/vim-bbye'                -- keep the split when close a buffer

  --  use 'gyim/vim-boxdraw'                        -- box drawing
  --  use 'vim-scripts/DrawItv'                     -- drawing
  -- TODO: mbbill/undotree
  -- TODO: try nvim-cmp https://www.youtube.com/watch?v=_DnmphIwnjo&t=12s
  -- use { 'michaelb/sniprun', run = 'bash ./install.sh'} -- code runner plugin (TODO: setup doesn't work)

  use 'folke/tokyonight.nvim'
  -- use 'folke/which-key.nvim'

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
