local key = vim.keymap.set
local opts = { noremap = true, buffer = 0 }

key('n', '<F5>', '<cmd>w | terminal python %<cr>a', opts)
