return {
 'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function ()
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
      },
      context_commentstring = {
        enable = true
      }
    }
  end
}
