vim.g.mapleader = " "

-- 'n' - нормальный режим (он же command/normal mode)
-- кроме него сущесвуют и другие: n, i, v, x

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>E', ':Neotree left focus<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('i', 'jj', '<Esc>')

-- highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')

-- terminal in nvim
vim.keymap.set('n', '<leader>t', ':FloatermNew --wintype=split --position=botright<CR>')
vim.keymap.set('n', '<leader>T', ':FloatermKill<CR>')

-- bread navigation
vim.keymap.set('n', '<leader>n', 'Navbuddy<CR>')
