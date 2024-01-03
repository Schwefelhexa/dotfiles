require("telescope").setup {
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	},
	defaults = {
		layout_strategy = "flex",
	}
}
require("telescope").load_extension("fzy_native")

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
		previewer = false,
	})
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>gf", telescope.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", telescope.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sr", telescope.registers, { desc = "[S]earch [R]egisters" })
vim.keymap.set("n", "<leader>sh", telescope.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", telescope.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", telescope.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", telescope.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>ss", telescope.lsp_definitions, { desc = "[S]earch [S]ymbols" })
vim.keymap.set("n", "<leader>st", ":TodoTelescope<CR>", { desc = "[S]earch [T]odo-comments " })
vim.keymap.set("n", "<leader><leader>", telescope.treesitter, { desc = "Search Treesitter" })

vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "[G]o to [R]eferences" })
vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "[G]o to [I]mplementations" })
vim.keymap.set("n", "gI", telescope.lsp_incoming_calls, { desc = "[G]o to [I]ncoming calls" })
vim.keymap.set("n", "gO", telescope.lsp_outgoing_calls, { desc = "[G]o to [O]utgoing calls" })
