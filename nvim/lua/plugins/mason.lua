-- LSP
local servers = {
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  }
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
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
