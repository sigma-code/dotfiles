local server_path = LSP_SERVERS_PATH .. "/rust/rust-analyzer"

require("lspconfig").rust_analyzer.setup {
  cmd = {server_path}
}
