--                              _                   _             
--  _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___  | |_   _  __ _ 
-- | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __| | | | | |/ _` |
-- | | | | | | (_| | |_) | |_) | | | | | (_| \__ \_| | |_| | (_| |
-- |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___(_)_|\__,_|\__,_|
--                 |_|   |_|            |___/                     

-- ~/.config/nvim/lua/setup/mappings.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '', '<cmd>NeoTreeShowToggle<cr>', opts) -- Maps to Control-/
map('n', '<M-/>', '<cmd>NeoTreeFloatToggle<cr>', opts) -- Maps to Control-/
map('n', '<F2>', '<cmd>nohlsearch<cr>', opts)
map('n', '<F3>', '<cmd>set spell!<cr>', opts)
map('n', '<F4>', '<cmd>set relativenumber!<cr>', opts)
map('n', '<M-,>', '<cmd>bprevious<cr>', opts)
map('n', '<M-.>', '<cmd>bnext<cr>', opts)
map('n', '<M-Del>', '<cmd>bdelete<cr>', opts)
map('n', '<M-Down>', '<cmd>m +1<cr>==', opts)
map('n', '<M-Up>', '<cmd>m -2<cr>==', opts)
map('n', '<M-c>', '<cmd>close<cr>', opts)
map('n', '<M-l>', '<cmd>set list! list?<cr>', opts)
map('n', '<M-n>', '<C-w>w', opts)
map('n', '<M-o>', '<cmd>only<cr>', opts)
map('n', '<leader>l', '<cmd>source ~/.config/nvim/lua/setup/luasnip.lua<cr>', opts)
map('n', '<leader>n', '<cmd>NeoTreeShowToggle<cr>', opts)
map('n', '<leader>p', '<cmd>PackerSync<cr>', opts)
map('n', '<leader>q', '<cmd>qa<cr>', opts)
map('n', '<leader>s', '<cmd>w | so %<cr>', opts)
map('n', '<leader>w', '<cmd>wa<cr>', opts)
map('n', '<leader>x', '<cmd>xa<cr>', opts)
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)


-------------------- INSERT MODE MAPPINGS --------------------
map('i', '<Up>', '<Nop>', opts)
map('i', '<Down>', '<Nop>', opts)
map('i', '<Left>', '<Nop>', opts)
map('i', '<Right>', '<Nop>', opts)


-------------------- VISUAL MODE MAPPINGS --------------------
map('v', '<M-Down>', ":m '>+1<cr>gv", opts)
map('v', '<M-Up>', ":m '<-2<cr>gv", opts)
