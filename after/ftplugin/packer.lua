local key = vim.keymap.set
local opts = { noremap = true, buffer = 0 }

key('n', '<Space>', '<C-f>', opts)
key('n', 'b', '<C-b>', opts)
key('n', '<Esc>', '<cmd>q<cr>', opts)
