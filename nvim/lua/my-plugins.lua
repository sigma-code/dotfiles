local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

-- Install all plugins on first install
local function install_all()
  vim.cmd("PackerInstall")
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- Window stats
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"

    -- Explorer
    use "glepnir/dashboard-nvim"
    use "kyazdani42/nvim-tree.lua"
    use "ahmedkhalf/lsp-rooter.nvim" -- with this nvim-tree will follow you

    -- Telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-project.nvim"

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    -- use "windwp/nvim-ts-autotag"
    -- use 'andymass/vim-matchup'
    
    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    -- use "glepnir/lspsaga.nvim"
    -- use "folke/trouble.nvim"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Debugging
    -- use "mfussenegger/nvim-dap"

    -- Autocomplete
    -- use "hrsh7th/nvim-compe"
    -- use "hrsh7th/vim-vsnip"
    -- use "rafamadriz/friendly-snippets"

    -- Sane gx for netrw_gx bug
    -- use "felipec/vim-sanegx"}

    use "folke/which-key.nvim"
    use "windwp/nvim-autopairs"
    use "kevinhwang91/nvim-bqf"

    -- Comments
    use "terrortylor/nvim-comment"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- Colorschemes
    use "ayu-theme/ayu-vim"
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    use {"gruvbox-community/gruvbox", opt = true}
    use {"joshdick/onedark.vim", opt = true}
    use {"flrnd/plastic.vim", opt = true}
    use {"sts10/vim-pink-moon", opt = true}
    use {"arcticicestudio/nord-vim", opt = true}
    use {"cocopon/iceberg.vim", opt = true}
    use {"sainnhe/sonokai", opt = true}

end)

