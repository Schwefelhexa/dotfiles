vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Window controls
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = "[W]indow: h" })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = "[W]indow: j" })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = "[W]indow: k" })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = "[W]indow: l" })
vim.keymap.set({ "n", "i", "v" }, "<C-x>", "<cmd>q<CR>", { silent = true })

-- Center Cursor for the win
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<C-e>", "<cmd>Ex<CR>", { silent = true })
