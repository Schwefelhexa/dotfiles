local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = "[H]arpoon [A]dd" })
vim.keymap.set('n', '<leader>hf', ui.toggle_quick_menu, { desc = "[H]arpoon [F]ind" })

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end)

require('leap').add_default_mappings()

