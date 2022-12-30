local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Set leader
map('n', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '

-- clear highlight
map('n', '<Leader>h', ':noh<CR>', opts)

-- System clipboard
map('v', '<C-c>', '"+y', opts)

-- Esc alt
-- map('i', '<leader><Tab>', '<Esc>', opts)

-- explorer
map('n', '<Leader>e', ':Telescope file_browser<CR>', opts)
map('n', '<C-f>', ':Telescope live_grep<CR>', opts)

-- Comments
map ("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

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
map('n', '<leader>P', ':Telescope<CR>', opts)
map('n', '<C-p>', ':Telescope find_files<CR>', opts)
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>sb", "<cmd>Telescope git_branches<CR>", opts)

-- Use shift + alt + hjkl to resize windows
map('n', '<S-M-j>', ':resize -2<CR>', opts)
map('n', '<S-M-k>', ':resize +2<CR>', opts)
map('n', '<S-M-h>', ':vertical resize -2<CR>', opts)
map('n', '<S-M-l>', ':vertical resize +2<CR>', opts)

-- Lsp
map("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>l", ":lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)
map("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
-- map("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
-- map("n", "<leader>i", ":Telescope lsp_code_actions<CR>", opts)
map("n", "<leader>i", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gr", ":Telescope lsp_references theme=cursor<CR>", opts)
--map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)

-- DAP
map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)

-- Git
map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
map("n", "<leader>grh", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
map("n", "<leader>gra", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)
