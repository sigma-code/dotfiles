local lsp_installer = require("nvim-lsp-installer")
LSP_SERVERS_PATH = DATA_PATH .. "/lsp_servers"

local servers = {
  "tsserver",
  "jsonls",
  "rust_analyzer",
  "sumenko_lua",
}

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

require("lsp.lua-ls")
require("lsp.json-ls")
require("lsp.java-ls")
require("lsp.javascript-ls")
require("lsp.rust-ls")

