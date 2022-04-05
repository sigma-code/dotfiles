local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Set leader
map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- clear highlight
map('n', '<Leader>h', ':noh<CR>', opts)

-- System clipboard
map('v', '<C-c>', '"+y', opts)

-- explorer
map('n', '<Leader>e', ':Telescope file_browser<CR>', opts)

-- Comments
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", opts)
map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- close buffer
map("n", "<leader>o", ":setl bufhidden=delete <bar> :bp<CR>", opts)

-- Better tabbing
map('v', '<Tab>', '>gv', opts)
map('v', '<S-Tab>', '<gv', opts)

-- Move lines
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('i', '<A-j> <Esc>', ':m .+1<CR>==gi', opts)
map('i', '<A-k> <Esc>', ':m .-2<CR>==gi', opts)
map('v', '<A-j>', ':m .+1<CR>gv==gv', opts)
map('v', '<A-k>', ':m .-2<CR>gv==gv', opts)

-- Navigation
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)
map('n', '<S-C-j>', '<C-W>+<CR>', opts)
map('n', '<S-C-k>', '<C-W>-<CR>', opts)
map('n', '<S-C-h>', '<C-W>><CR>', opts)
map('n', '<S-C-l>', '<C-W><<CR>', opts)

-- Telescope
map('n', '<S-C-p>', ':Telescope<CR>', opts)
map('n', '<C-p>', ':Telescope find_files<CR>', opts)

-- Use shift + alt + hjkl to resize windows
map('n', '<S-M-j>', ':resize -2<CR>', opts)
map('n', '<S-M-k>', ':resize +2<CR>', opts)
map('n', '<S-M-h>', ':vertical resize -2<CR>', opts)
map('n', '<S-M-l>', ':vertical resize +2<CR>', opts)

-- Lsp
map("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>l", ":lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)
map("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
map("n", "<leader>i", ":Telescope lsp_code_actions<CR>", opts)
map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gr", ":Telescope lsp_references theme=cursor<CR>", opts)
--map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)

