-- hjkl
vim.api.nvim_set_keymap('n', 'j', 'h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'k', 'j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'l', 'k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'ñ', 'l', {noremap = true, silent = true})
-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<C-h>', ':noh<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>{', ':Dashboard<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>-", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>-", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>o", ":setl bufhidden=delete <bar> :bp<CR>", {noremap = true, silent = true})

-- open projects
vim.api.nvim_set_keymap('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>",
                        {noremap = true, silent = true})

-- Terminal
vim.api.nvim_set_keymap('n', '<leader>t', ':split term://zsh<CR>', {noremap = true, silent = true})
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

-- Easy CAPS
vim.api.nvim_set_keymap('n', '<leader>U', 'viwU<Esc>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>u', 'viwu<Esc>', {noremap = true, silent = true})

-- Better tabbing
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})

-- Move lines
vim.api.nvim_set_keymap('n', '<A-k>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-k> <Esc>', ':m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-l> <Esc>', ':m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m .+1<CR>gv==gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-l>', ':m .-2<CR>gv==gv', {noremap = true, silent = true})

-- Navigation
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-q>', ':q!<CR>', {noremap = true, silent = true})
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

