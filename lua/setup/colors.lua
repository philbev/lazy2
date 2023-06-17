-- ~/.config/nvim/lua/setup/colorscheme.lua

--local colorscheme = 'gruvbox8_hard'
--local colorscheme = 'base16-gruvbox-dark-hard'
local colorscheme = 'gruvbox-baby'

local status_ok,_ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not status_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
end

-------------------- HIGHLIGHTS --------------------
vim.cmd[[ highlight @comment guifg=#bbbbbb ]]
vim.cmd[[ highlight Comment guifg=#888888 ]]
vim.cmd[[ highlight LineNr guifg=#bbbbbb ]]
vim.cmd[[ highlight NonText guifg=yellow ]]
vim.cmd[[ highlight WinSeparator guibg=None ]]
vim.cmd[[ highlight CursorLine guibg=#505050 ]]
vim.cmd[[ highlight Normal guibg=None ]]
vim.cmd[[ highlight Search gui=None guibg=#4c7899 ]]
vim.cmd[[ highlight IncSearch gui=None guibg=#777700 ]]

