vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")

vim.api.nvim_create_autocmd({ "UIEnter" }, {
	pattern = "*",
	callback = function()
		local current_window = vim.api.nvim_get_current_win()
		require("trouble").open()
		vim.api.nvim_set_current_win(current_window)
	end,
})
