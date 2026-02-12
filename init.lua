vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.cmd("colorscheme kanagawa-dragon")

require("nvim-tree").setup()

-- Keymaps
vim.keymap.set('n', '<leader>q', '<cmd>wqa<cr>', { desc = 'Quit all' })

vim.keymap.set('n', '<leader>p', '<cmd>:Lazy<cr>', { desc = 'Open lazy menu' })

vim.keymap.set('n', 'th', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', 'tl', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', 'tj', '<cmd>BufferPrevious<cr>', { desc = 'Previous tab' })
vim.keymap.set('n', 'tk', '<cmd>BufferNext<cr>', { desc = 'Next tab' })
vim.keymap.set('n', 'tw', '<cmd>BufferClose<cr>', { desc = 'Next tab' })
vim.keymap.set('n', 'tt', '<cmd>BufferPick<cr>', { desc = 'Pick tab' })
