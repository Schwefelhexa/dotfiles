local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("nvim-treesitter/nvim-treesitter-context")

  use("lewis6991/gitsigns.nvim")
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

  use 'ThePrimeagen/refactoring.nvim'

  use {
    "sudormrfbin/cheatsheet.nvim",
    requires = {
      { 'nvim-lua/popup.nvim' }
    }
  }

  use "tversteeg/registers.nvim"
  use "zbirenbaum/neodim"
  use "rcarriga/nvim-notify"

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function ()
      require("albarn.dashboard")
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use 'ggandor/leap.nvim'

  use "folke/trouble.nvim"
  use "folke/todo-comments.nvim"

  use 'm4xshen/autoclose.nvim'
  use 'voldikss/vim-floaterm'

  use { 'catppuccin/nvim', as = 'catppuccin' }

  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-tree/nvim-web-devicons" },
  }

  use "folke/which-key.nvim"

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Status info
      { 'j-hui/fidget.nvim' }
    }
  }

  use "github/Copilot.vim"

  use "seandewar/killersheep.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
