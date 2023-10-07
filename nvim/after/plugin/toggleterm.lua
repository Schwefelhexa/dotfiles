local lazygit = nil

vim.keymap.set("n", "<leader>wg", function()
	require("toggleterm").setup()

	if lazygit == nil then
		lazygit = require("toggleterm.terminal").Terminal:new({
			cmd = "lazygit",
			direction = "float",
			float_opts = {
				border = "none",
				width = 100000,
				height = 100000,
			},
		})
	end

	lazygit:toggle()
end)
