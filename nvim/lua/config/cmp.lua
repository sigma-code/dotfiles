local lspkind = require("lspkind")
lspkind.init()

require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp = require("cmp")

cmp.setup {
  preselect = "Item",
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
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

--vim.cmd("set completeopt=noinsert")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
