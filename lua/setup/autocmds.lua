--              _                           _       _             
--   __ _ _   _| |_ ___   ___ _ __ ___   __| |___  | |_   _  __ _ 
--  / _` | | | | __/ _ \ / __| '_ ` _ \ / _` / __| | | | | |/ _` |
-- | (_| | |_| | || (_) | (__| | | | | | (_| \__ \_| | |_| | (_| |
--  \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|___(_)_|\__,_|\__,_|
--                                                                

-- ~/.config/nvim/lua/setup/autocmds.lua

local au = vim.api.nvim_create_autocmd

-- Highlight yanked text
au({ 'TextYankPost' }, {
    pattern = { '*' },
    command = "lua vim.highlight.on_yank({ timeout = 1000, higroup = IncSearch })",
})

-- Display cursorline on active windows only.
au({ 'BufEnter', 'WinEnter' }, {
    pattern = '*',
    command = "lua vim.o.cursorline = true"
})
au({ 'WinLeave' }, {
    pattern = '*',
    command = "lua vim.o.cursorline = false"
})

-- No comments to be generated after 'o' or after hitting 'Enter'.
au({ 'FileType' }, {
    pattern = '*',
    command = "lua vim.opt.formatoptions:remove { 'r', 'o' }"
})
