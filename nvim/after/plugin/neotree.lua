require('neo-tree').setup({
  filesystem = {
    follow_current_file = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<leader>e', ":Neotree toggle<CR>", { desc = "[E]xplorer" })
vim.api.nvim_create_autocmd('StdinReadPre', { command = "let s:std_in=1", pattern = "*" })

-- Open NeoTree when opening nvim in folder
vim.api.nvim_create_autocmd('VimEnter',
  {
    command =
    "if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'Neotree toggle' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif",
    pattern = "*"
  })
