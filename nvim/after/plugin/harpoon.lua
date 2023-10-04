local configured = false

local function ensure_configured()
	if configured then return end

	require("harpoon").setup({
		save_on_toggle = true,
		tabline = true
	})

	configured = true
end

local function register(mode, shortcut, harpoon_module, fn_name, param)
	vim.keymap.set(mode, shortcut, function()
		ensure_configured()
		require(harpoon_module)[fn_name](param)
	end, {})
end

register("n", "<leader>ha", "harpoon.mark", "add_file")
register("n", "<leader>hf", "harpoon.ui", "toggle_quick_menu")

register("n", "<leader>hh", "harpoon.ui", "nav_file", 1)
register("n", "<leader>hj", "harpoon.ui", "nav_file", 2)
register("n", "<leader>hk", "harpoon.ui", "nav_file", 3)
register("n", "<leader>hl", "harpoon.ui", "nav_file", 4)
