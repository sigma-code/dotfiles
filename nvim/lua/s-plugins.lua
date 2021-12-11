--Install Packer if not present
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end
local _, packer = pcall(require, "packer")
packer.init {
  package_root = package_root,
  compile_path = compile_path,
  log = { level = log_level },
  git = { clone_timeout = 300 },
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugin list
return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- Git
  use { "tpope/vim-fugitive" }

  -- Telescope
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzy-native.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }

  -- Asthetics
  use { "vim-airline/vim-airline" }
  use { "vim-airline/vim-airline-themes" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "rainglow/vim" }
  use { "christianchiarulli/nvcode-color-schemes.vim" }
  use { "kyazdani42/nvim-web-devicons" }
end)
