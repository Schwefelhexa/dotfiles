require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(_, buf)
			-- disable treesitter for large files
			local max_filesize = 100 * 1024   -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				print("")
				return true
			end
		end,
	},
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
				['ah'] = '@comment.outer',
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
				[']h'] = '@comment.outer'
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
				[']I'] = '@conditional.outer',
				[']L'] = '@loop.outer',
				[']H'] = '@comment.outer'
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
				['[i'] = '@conditional.outer',
				['[l'] = '@loop.outer',
				['[h'] = '@comment.outer'
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
				['[I'] = '@conditional.outer',
				['[L'] = '@loop.outer',
				['[H'] = '@comment.outer'
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
