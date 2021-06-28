-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.lspls.diagnostics.virtual_text,
            signs = O.lspls.diagnostics.signs,
            underline = O.lspls.diagnostics.underline,
            update_in_insert = true
        })
    },
	 settings = {
      python = {
        analysis = {
		      typeCheckingMode = "basic",
		      autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
}
