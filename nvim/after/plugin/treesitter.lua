require("nvim-treesitter.configs").setup({
	auto_install = true,
	autotag = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['ii'] = '@conditional.inner',
				['ai'] = '@conditional.outer',
				['il'] = '@loop.inner',
				['al'] = '@loop.outer',
				['at'] = '@comment.outer',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
				[']i'] = '@conditional.outer',
				[']l'] = '@loop.outer',
				[']t'] = '@comment.outer'
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
				[']I'] = '@conditional.outer',
				[']L'] = '@loop.outer',
				[']T'] = '@comment.outer'
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
				['[i'] = '@conditional.outer',
				['[l'] = '@loop.outer',
				['[t'] = '@comment.outer'
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
				['[I'] = '@conditional.outer',
				['[L'] = '@loop.outer',
				['[T'] = '@comment.outer'
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	}
})
