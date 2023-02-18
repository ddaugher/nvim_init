local opts = { noremap = true, silent = true }
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use ctrl-[hjkl] to select the active split!
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

--resize with arrows
vim.api.nvim_set_keymap("n", "<A-Up>", ":resize +2<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-Down>", ":resize -2<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize +2<cr>", opts)
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize -2<cr>", opts)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<c-a-q>', ':qa!<CR>')
vim.keymap.set('n', '<leader>q', ':enew<bar>bd #<CR>')

-- Ctrl-E / A in insert mode to go to the end / start of the line
vim.keymap.set('i', '<C-E>', '<ESC>A')
vim.keymap.set('i', '<C-A>', '<ESC>I')

-- Ctrl-Shift-V to paste
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set('c', '<C-S-v>', '<C-r>+')
vim.keymap.set('n', '<C-S-v>', '"+p')

-- Spectre
vim.keymap.set('n', 'S', "<cmd>lua require('spectre').open()<cr>", { desc = '[S]earch Project' })
vim.keymap.set('n', 'sw', "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", { desc = "[S]earch [W]ord" })
vim.keymap.set('n', 'sf', "<cmd>lua require('spectre').open_file_search()<cr>", { desc = "[S]earch [F]ile" })

-- Bufferline
vim.api.nvim_set_keymap("n", "<S-h>", ":BufferLineCyclePrev<cr>", opts)
vim.api.nvim_set_keymap("n", "<S-L>", ":BufferLineCycleNext<cr>", opts)
