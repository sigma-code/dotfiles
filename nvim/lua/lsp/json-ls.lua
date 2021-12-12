local server_path = LSP_SERVERS_PATH .. "/jsonls/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server"

require("lspconfig").jsonls.setup {
  cmd = {
    server_path,
    "--stdio"
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}
