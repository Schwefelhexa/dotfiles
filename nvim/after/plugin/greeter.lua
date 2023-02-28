local function eval(command, fallback)
  local handle = io.popen(command)
  if not handle then
    return fallback
  end

  local result = handle:read("*a")
  handle:close()
  return result
end

local header = eval("botsay -c $(curl --no-progress-meter https://icanhazdadjoke.com)", "No botsay, no fun :(")
local stats = require("lazy").stats()

require("mini.starter").setup({
  header = header,
  items = {
    { name = "Item 1", section = "Section A", action = "" },
    { name = "Item 2", section = "Section A", action = "" },
    { name = "Item 3", section = "Section A", action = "" },
  },
  footer = "🚀 Loaded " .. stats.loaded .. " plugins. Blazingly fast! 🚀"
})
