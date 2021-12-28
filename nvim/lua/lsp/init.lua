local lsp_installer = require("nvim-lsp-installer")
LSP_SERVERS_PATH = DATA_PATH .. "/lsp_servers"

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  severity_sort = true,
  signs = {
    active = signs
  },
  float = {
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local servers = {
  "tsserver",
  "jsonls",
  "rust_analyzer",
  "sumenko_lua",
}

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

