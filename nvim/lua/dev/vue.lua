local server_root = LSP_SERVERS_PATH .. "/volar/node_modules"
local vue_server_path = server_root .. "/@volar/vue-language-server/bin/vue-language-server.js"
local ts_server_path = server_root .. "/typescript/lib/tsserverlibrary.js"
local root_pattern = require("lspconfig/util").root_pattern

require("lspconfig").volar.setup {
  cmd = {"node", vue_server_path, "--stdio"},
  filetypes = {'vue'},
  root_dir = root_pattern("package.json","vue.config.js", "vite.config.ts"),
  init_options = {
    hostInfo = "neovim",
    typescript = {
      serverPath = ts_server_path
    }
  }
}

