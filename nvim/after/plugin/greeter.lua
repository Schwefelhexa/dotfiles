local function eval(command, fallback)
  local handle = io.popen(command)
  if not handle then
    return fallback
  end

  local result = handle:read("*a")
  handle:close()
  return result
end

local header = eval("~/.files/nvim/bin/random_joke", "No joke today :(")
local stats = require("lazy").stats()

local function download_jokes()
  eval("~/.files/nvim/bin/fetch_jokes", "Failed to download jokes :(")
end

require("mini.starter").setup({
  header = header,
  items = {
    { name = "Item 1", section = "Section A", action = "" },
    { name = "Item 2", section = "Section A", action = "" },
    { name = "Item 3", section = "Section A", action = "" },
  },
  footer = "🚀 Loaded " .. stats.loaded .. " plugins. Blazingly fast! 🚀"
})

vim.keymap.set('n', '<leader>d', download_jokes)
