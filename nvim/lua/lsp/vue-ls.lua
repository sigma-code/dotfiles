local server_path = LSP_SERVERS_PATH .. "/volar/node_modules/@volar/server/bin/volar-server.js"

require("lspconfig").volar.setup {
  cmd = {server_path, "--stdio"},
  filetypes = {'vue'}
}
