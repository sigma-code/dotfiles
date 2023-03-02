-- LSP
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "" },
  { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  severity_sort = true,
  signs = {
    active = signs
  },
  float = {
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
})

-- Languages
--[[ local lsp_servers_path = vim.fn.stdpath('data') .. "/mason/packages" ]]
local cache_path = os.getenv('HOME') .. '.cache/jdtls'
local servers = {
  sumneko_lua = require('plugins.mason.lua'),
  --[[ jdtls = require('plugins.mason.java'), ]]
  jdtls = {
    cmd = {
      'jdtls',
      --[[ '-javaagent:' .. server_path .. '/lombok.jar', ]]
      '-javaagent: lombok.jar',
      '-configuration', cache_path .. '/config',
      '-data', cache_path .. '/workspace'
    },
  },
  volar = {},
  rust_analyzer = {},
  jsonls = {},
  --[[ tsserver = {} ]]
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
            if server_name ~= 'volar' then
              require('lspconfig')[server_name].setup {
                settings = servers[server_name],
              }
            else
              require('lspconfig').volar.setup {
                filetypes = {
                  'typescript',
                  'javascript',
                  'vue',
                  'json'
                },
                init_options = {
                  typescript = {
                    tsdk = ''
                  }
                }
              }
            end
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
