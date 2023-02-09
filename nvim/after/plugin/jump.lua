local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = "[H]arpoon [A]dd" })
vim.keymap.set('n', '<leader>hf', ui.toggle_quick_menu, { desc = "[H]arpoon [F]ind" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

require('leap').add_default_mappings()

