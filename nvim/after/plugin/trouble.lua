vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")

vim.api.nvim_create_autocmd({ "UIEnter" }, {
	pattern = "*",
	callback = function()
		local current_window = vim.api.nvim_get_current_win()
		require("trouble").open()
		vim.api.nvim_set_current_win(current_window)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype == "Trouble" then
			vim.wo.colorcolumn = ""
		end
	end
})
