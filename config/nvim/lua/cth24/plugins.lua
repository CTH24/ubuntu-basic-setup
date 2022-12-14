-- plugins.lua

local status, packer = pcall(require, "packer")

if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)


    --------------------------------------------------------------------------------
    -- Packer
    --------------------------------------------------------------------------------
    use 'wbthomason/packer.nvim'




    --------------------------------------------------------------------------------
    -- LSP
    --------------------------------------------------------------------------------

    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason-lspconfig.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'williamboman/mason.nvim'




    --------------------------------------------------------------------------------
    -- Copilot
    --------------------------------------------------------------------------------

    use {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
            end, 100)
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup {
                method = "getCompletionsCycling",
            }
        end
    }




    --------------------------------------------------------------------------------
    -- CMP
    --------------------------------------------------------------------------------

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'




    --------------------------------------------------------------------------------
    -- navic
    --------------------------------------------------------------------------------

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }



    --------------------------------------------------------------------------------
    -- LuaSnip
    --------------------------------------------------------------------------------


    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }




    --------------------------------------------------------------------------------
    -- nvim-web-devicons
    --------------------------------------------------------------------------------

    use 'kyazdani42/nvim-web-devicons' -- File icons




    --------------------------------------------------------------------------------
    -- nvim-autopairs
    --------------------------------------------------------------------------------

    use 'windwp/nvim-autopairs'




    --------------------------------------------------------------------------------
    -- nvim-autopairs
    --------------------------------------------------------------------------------

    use 'windwp/nvim-ts-autotag'




    --------------------------------------------------------------------------------
    -- nvim-colorizer
    --------------------------------------------------------------------------------

    use 'norcalli/nvim-colorizer.lua'




    --------------------------------------------------------------------------------
    -- zen-mode
    --------------------------------------------------------------------------------

    use 'folke/zen-mode.nvim'




    --------------------------------------------------------------------------------
    -- gitsigns
    --------------------------------------------------------------------------------

    use 'lewis6991/gitsigns.nvim'




    --------------------------------------------------------------------------------
    -- git
    --------------------------------------------------------------------------------

    use 'dinhhuy258/git.nvim'
    use 'tpope/vim-fugitive'




    --------------------------------------------------------------------------------
    -- telescope
    --------------------------------------------------------------------------------

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'




    --------------------------------------------------------------------------------
    -- wilder
    --------------------------------------------------------------------------------

    use 'gelguy/wilder.nvim'
    use 'romgrk/fzy-lua-native'
    use({
        "rinx/nvim-ripgrep",
        config = function()
            require("nvim-ripgrep").setup({
                open_qf_fn = require("nvim-ripgrep.extensions").trouble_open_qf,
            })
        end,
    })




    --------------------------------------------------------------------------------
    -- alpha-nvim
    --------------------------------------------------------------------------------

    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }




    --------------------------------------------------------------------------------
    -- Themes
    --------------------------------------------------------------------------------

    use 'Shatur/neovim-ayu'
    use 'ellisonleao/gruvbox.nvim'




    --------------------------------------------------------------------------------
    -- express_line
    --------------------------------------------------------------------------------

    use 'tjdevries/express_line.nvim'




    --------------------------------------------------------------------------------
    -- ToggleTerm
    --------------------------------------------------------------------------------

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
            shell = vim.o.shell,
            direction = "float",
            winblend = 1,
        })
    end }




    --------------------------------------------------------------------------------
    -- WhichKey
    --------------------------------------------------------------------------------

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }




    --------------------------------------------------------------------------------
    -- nvim-transparent
    --------------------------------------------------------------------------------

    use 'xiyaowong/nvim-transparent'
    require("transparent").setup({
        enable = false,
        extra_groups = {
            'all'
        },
        exclude = {}, -- table: groups you don't want to clear
    })




    --------------------------------------------------------------------------------
    -- Fidget
    --------------------------------------------------------------------------------

    use { 'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end
    }




    --------------------------------------------------------------------------------
    -- PHPactor
    --------------------------------------------------------------------------------
    use 'phpactor/phpactor'




    --------------------------------------------------------------------------------
    -- TMUX Navigation
    --------------------------------------------------------------------------------

    use { 'alexghergh/nvim-tmux-navigation', config = function()
        require 'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true,
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                next = "<C-Space>",
            }
        }
    end
    }


end) -- packer.startup





--------------------------------------------------------------------------------
--  Autoload Plugins on Save                                                  --
--------------------------------------------------------------------------------

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
