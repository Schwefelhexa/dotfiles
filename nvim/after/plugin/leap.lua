local leap = require("leap")

leap.opts.equivalence_classes = { ' \t\r\n', 'aä', 'oö', 'uü', 'sß' }
leap.add_default_mappings()

-- Jump in all windows using <C-s>
vim.keymap.set('n', '<C-s>', function()
  local focusable_windows_on_tabpage = vim.tbl_filter(
    function(win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)
