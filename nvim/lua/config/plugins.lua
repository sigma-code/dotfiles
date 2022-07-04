--Install Packer if not present
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end
local _, packer = pcall(require, "packer")
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Auto install plugins on file update
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Plugin list
return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- Telescope
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzy-native.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "mfussenegger/nvim-jdtls" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Auto Comments
  use {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" }
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  }

  -- Auto Completion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "onsails/lspkind-nvim" }
  use { "windwp/nvim-autopairs" }

  -- Terminal
  use { "akinsho/toggleterm.nvim" }

  -- Asthetics
  --use { "vim-airline/vim-airline" }
  --use { "vim-airline/vim-airline-themes" }
  use { "nvim-lualine/lualine.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "rainglow/vim" }
  use { "christianchiarulli/nvcode-color-schemes.vim" }
  use { "kyazdani42/nvim-web-devicons" }
end)
