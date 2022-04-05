vim.cmd "hi clear"
if vim.fn.exists "syntax_on" then
  vim.cmd "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "neoallure"

local modules = {
  "base",
  "treesitter",
  "lsp",
  "others",
}

local highlights = {}

C = require "theme.colors"

for _, module in ipairs(modules) do
  highlights = vim.tbl_deep_extend("force", highlights, require("theme." .. module))
end

