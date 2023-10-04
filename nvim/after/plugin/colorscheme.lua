vim.cmd.colorscheme "catppuccin-macchiato"

-- Some personal tweaks
local colors = require("catppuccin.palettes.macchiato")
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.lavender })
vim.api.nvim_set_hl(0, "HarpoonActive", { bg = colors.surface0, fg = colors.mauve })
vim.api.nvim_set_hl(0, "HarpoonNumberActive", { bg = colors.surface0, fg = colors.mauve })
vim.api.nvim_set_hl(0, "HarpoonInactive", { bg = colors.crust, fg = colors.surface2 })
vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { bg = colors.crust, fg = colors.surface2 })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.crust })

