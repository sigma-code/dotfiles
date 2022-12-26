local server_path = LSP_SERVERS_PATH .. "/kotlin/server/bin/kotlin-language-server"
-- local root_pattern = require("lspconfig/util").root_pattern

require("lspconfig").kotlin_language_server.setup {
  cmd = {
    server_path,
  }
}
