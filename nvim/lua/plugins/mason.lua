-- LSP
local servers = {
  sumneko_lua = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  }
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-jdtls',
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        local mason_lspconfig = require('mason-lspconfig')

        mason_lspconfig.setup {
          ensure_installed = vim.tbl_keys(servers)
        }

        mason_lspconfig.setup_handlers {
          function(server_name)
            require('lspconfig')[server_name].setup {
              settings = servers[server_name],
            }
          end
        }
      end
    },
    {
      'j-hui/fidget.nvim',
      config = function()
        require('fidget').setup {}
      end
    }
  },
  config = function()
    require('mason').setup {
      ui = {
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗"
        }
      }
    }
  end
}
