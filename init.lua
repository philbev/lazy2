--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--                                

-- ~/.config/nvim/lua/setup/../../init.lua

require'setup.settings'
require'setup.lazy'
--require'setup.notify'
require'setup.colors'
--require'setup.packer'
require'setup.mappings'
require'setup.treesitter'
require'setup.completion'
require'setup.colorizer'
require'setup.autopairs'
require'setup.indentline'
require'setup.telescope'
require'setup.autocmds'
require'setup.lualine'
require'setup.onedark'
require'setup.whichkey'
require'setup.surround'
require'setup.toggleterm'
require'setup.markdown'
require'setup.luasnip'
require'setup.mason'
require'setup.lspconfig'
require'setup.gitsigns'
require'setup.lastplace'
--require'setup.fidget'

-- If the current buffer is a 'No Name' buffer, display the startup page
if vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) == '' then
    vim.cmd('intro')
end
