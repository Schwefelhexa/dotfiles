local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = "[H]arpoon [A]dd" })
vim.keymap.set('n', '<leader>hf', ui.toggle_quick_menu, { desc = "[H]arpoon [F]ind" })

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end)

-- Jump using s key
require('leap').opts.equivalence_classes = { ' \t\r\n', 'aä', 'oö', 'uü', 'sß' }  -- Nicer jumps in german text
require('leap').add_default_mappings()
-- Jump in all windows using <C-s>
vim.keymap.set('n', '<C-s>', function()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function(win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)
