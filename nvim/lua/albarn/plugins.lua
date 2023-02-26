local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',

  -- Navigation
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 },
  'ggandor/leap.nvim',
  "theprimeagen/harpoon",

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
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
      { 'j-hui/fidget.nvim' },
    },
  },

  -- Basic UI
  'voldikss/vim-floaterm',
  {
    'nvim-lualine/lualine.nvim',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-tree/nvim-web-devicons" },
  },

  -- Improved UI
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",
  "folke/todo-comments.nvim",
  'lukoshkin/trailing-whitespace', -- Highlight trailing whitespace
  "folke/trouble.nvim",
  "lewis6991/gitsigns.nvim",
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      { 'nvim-lua/popup.nvim' },
    },
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function ()
      require("albarn.dashboard")
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  "mbbill/undotree",

  -- Utilities
  "tversteeg/registers.nvim",
  'm4xshen/autoclose.nvim',
  "folke/which-key.nvim",
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  "theprimeagen/refactoring.nvim",

  -- Colorschemes
  "zbirenbaum/neodim",
  { 'catppuccin/nvim', as = 'catppuccin' },
  { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' },

  -- Silly stuff
  "seandewar/killersheep.nvim",

  -- Dependencies
  "rcarriga/nvim-notify",

  -- Copilot
  "github/Copilot.vim",

  -- Notes
  "renerocksai/telekasten.nvim",
  "renerocksai/calendar-vim"
}

require("lazy").setup(plugins, {})