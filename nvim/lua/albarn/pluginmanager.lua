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
	{ "nvim-lua/telescope.nvim",                  branch = "0.1.x", command = "Telescope" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
			{ "nvim-treesitter/nvim-treesitter-context",     lazy = false },
			{ "windwp/nvim-ts-autotag",                      lazy = false },
		}
	},

	"catppuccin/nvim",

	"ggandor/leap.nvim",
	"theprimeagen/harpoon",

	{ "windwp/nvim-autopairs",             event = "InsertEnter", opts = {} },
	{ "folke/todo-comments.nvim",          opts = {},             lazy = false },
	{ "numToStr/Comment.nvim",             opts = {},             lazy = false },

	-- LSP Stuff
	{ "williamboman/mason.nvim",           config = true,         lazy = false },
	{ "neovim/nvim-lspconfig",             lazy = false },
	{ "williamboman/mason-lspconfig.nvim", lazy = false },
	{ "j-hui/fidget.nvim",                 tag = "legacy",        opts = {},   lazy = false },
	"folke/neodev.nvim",

	-- Autocompletion
	{ "hrsh7th/nvim-cmp",         lazy = false, },
	{ "L3MON4D3/LuaSnip",         lazy = false, },
	{ "saadparwaiz1/cmp_luasnip", lazy = false, },
	{ "hrsh7th/cmp-nvim-lsp",     lazy = false, },

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
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", cmd = "Neotree" },
	{ "stevearc/dressing.nvim", opts = {}, lazy = false },
	"zbirenbaum/copilot.lua",
	"akinsho/toggleterm.nvim",

	{ 'f-person/git-blame.nvim', cmd = 'GitBlameToggle' },

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Per-project configuration, supports vscode settings.json
	{ "folke/neoconf.nvim" },

	-- Create missing directories before writing file
	{ "jghauser/mkdir.nvim", event = "BufWritePre" },

	"ThePrimeagen/refactoring.nvim",

	{ "folke/which-key.nvim",            opts = {},                lazy = false },

	-- Stupid stuff
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}, lazy_config)
