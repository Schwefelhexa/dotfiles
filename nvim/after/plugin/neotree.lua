local initialized = false

vim.keymap.set("n", "<leader>e", function()
	if not (initialized) then
		require('neo-tree').setup({
			filesystem = {
				follow_current_file = {
					enable = true,
				},
			},
		})
		initialized = true
	end

	vim.cmd [[Neotree toggle]]
end)

vim.api.nvim_create_autocmd('StdinReadPre', { command = "let s:std_in=1", pattern = "*" })
