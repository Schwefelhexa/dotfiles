local initialized = false

local function register(mode, shortcut, command, opts)
	vim.keymap.set(mode, shortcut, function()
		if not initialized then
			require("refactoring").setup({})
			initialized = true
		end

		vim.cmd(command)
	end, opts)
end

register("x", "<leader>re", ":Refactor extract", { desc = "[R]efactor [E]xtract" })
register("x", "<leader>rf", ":Refactor extract_to_function", { desc = "[R]efactor extract [F]unction" })
register("x", "<leader>rv", ":Refactor extract_var", { desc = "[R]efactor extract [V]ariable" })
