local server_path = LSP_SERVERS_PATH .. "/tsserver/node_modules/.bin/typescript-language-server"
local root_pattern = require("lspconfig/util").root_pattern
local dap = require('dap')

require("lspconfig").tsserver.setup {
  cmd = {
    server_path,
    "--stdio"
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "index.js")
}

-- DAP
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/dev/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

