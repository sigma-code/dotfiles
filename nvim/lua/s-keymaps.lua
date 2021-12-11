-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- clear highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':noh<CR>', {noremap = true, silent = true})

-- System clipboard
vim.api.nvim_set_keymap('n', '<Leader>y', ':"+y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>p', ':"+p', {noremap = true, silent = true})

-- explorer
--vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Comments
--vim.api.nvim_set_keymap("n", "<leader>-", ":CommentToggle<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("v", "<leader>-", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>o", ":setl bufhidden=delete <bar> :bp<CR>", {noremap = true, silent = true})

-- Better tabbing
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})

-- Move lines
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-j> <Esc>', ':m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-k> <Esc>', ':m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m .+1<CR>gv==gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m .-2<CR>gv==gv', {noremap = true, silent = true})

-- Navigation
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>J', '<C-W>+<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>K', '<C-W>-<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>H', '<C-W>><CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>L', '<C-W><<CR>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- Use shift + alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<S-M-j>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-M-k>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-M-h>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-M-l>', ':vertical resize +2<CR>', {noremap = true, silent = true})
