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
  "lewis6991/impatient.nvim",

  -- Navigation
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make",     cond = vim.fn.executable "make" == 1 },
  "ggandor/leap.nvim",
  "theprimeagen/harpoon",

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional

      -- Status info
      "j-hui/fidget.nvim",
    },
  },
  "folke/neoconf.nvim", -- Per-project configuration

  -- Basic UI
  "voldikss/vim-floaterm",
  "nvim-lualine/lualine.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-tree/nvim-web-devicons" },
  },

  -- Improved UI
  { "nvim-treesitter/nvim-treesitter",          run = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",
  "folke/todo-comments.nvim",
  "lukoshkin/trailing-whitespace",       -- Highlight trailing whitespace
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines

  -- Utilities
  "tversteeg/registers.nvim",
  "m4xshen/autoclose.nvim",
  "folke/which-key.nvim",
  "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
  "theprimeagen/refactoring.nvim",
  "kylechui/nvim-surround",
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Colorschemes
  "zbirenbaum/neodim",
  "catppuccin/nvim",

  -- Silly stuff
  "seandewar/killersheep.nvim",

  -- Dependencies
  "rcarriga/nvim-notify",

  -- Copilot
  "github/Copilot.vim",

  -- Notes
  "renerocksai/telekasten.nvim",

  -- Misc
  { "echasnovski/mini.nvim", version = "*" },
}

require("lazy").setup(plugins, {})
