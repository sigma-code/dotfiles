local server_path = LSP_SERVERS_PATH .. "/tsserver/node_modules/.bin/typescript-language-server"
local root_pattern = require("lspconfig/util").root_pattern

require("lspconfig").tsserver.setup {
  cmd = {
    server_path,
    "--stdio"
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}
