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

local lazy_config = {
	defaults = {
		lazy = true
	}
}

require("lazy").setup({
	-- Generic dependencies
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "MunifTanjim/nui.nvim",                     lazy = false },

	-- Telescope + Dependencies
	{ "nvim-telescope/telescope-fzy-native.nvim", lazy = false },
	{ "nvim-lua/telescope.nvim",                  branch = "0.1.x",   command = "Telescope" },
	{ "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context",  lazy = false },

	"catppuccin/nvim",

	"ggandor/leap.nvim",
	"theprimeagen/harpoon",

	{ "windwp/nvim-autopairs",    event = "InsertEnter", opts = {} },
	{ "folke/todo-comments.nvim", opts = {},             lazy = false },
	{ "numToStr/Comment.nvim",    opts = {},             lazy = false },

	-- LSP Stuff
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	{ "j-hui/fidget.nvim", tag = "legacy", opts = {}, lazy = false },
	"folke/neodev.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>hp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[H]unk [P]revious' })
				vim.keymap.set('n', '<leader>hn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[H]unk [N]ext' })
				vim.keymap.set('n', '<leader>hv', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[H]unk Pre[v]iew' })
			end,
		},
		lazy = false
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "┊" } }, lazy = false },
	"nvim-lualine/lualine.nvim",
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",                                                       cmd = "Neotree" },
	{ "stevearc/dressing.nvim",      opts = {},                                                             lazy = false },
	{ "folke/trouble.nvim",          cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" } },
	"zbirenbaum/copilot.lua",
	"akinsho/toggleterm.nvim",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Per-project configuration, supports vscode settings.json
	{ "folke/neoconf.nvim",  opts = {},            lazy = false },

	-- Create missing directories before writing file
	{ "jghauser/mkdir.nvim", event = "BufWritePre" },

	"ThePrimeagen/refactoring.nvim",

	{ "folke/which-key.nvim", opts = {}, lazy = false },
}, lazy_config)
