require("todo-comments").setup({
	highlight = {
		pattern = [[.*<(KEYWORDS)\s*:?]],  -- Also support comment without colon 
	}
})
