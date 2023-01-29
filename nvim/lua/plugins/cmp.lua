return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind-nvim',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup{
          disable_filetype = { "TelescopePrompt", "vim" }
        }
      end
    }
  },
  config = function ()
    local lspkind = require("lspkind")
    lspkind.init()

    local cmp = require("cmp")

    cmp.setup {
      preselect = "Item",
      mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<Esc>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = "[buff]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
          }
        }
      }
    }

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
  end
}

