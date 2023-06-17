--              _                    _            _             
--   __ _ _   _| |_ ___  _ __   __ _(_)_ __ ___  | |_   _  __ _ 
--  / _` | | | | __/ _ \| '_ \ / _` | | '__/ __| | | | | |/ _` |
-- | (_| | |_| | || (_) | |_) | (_| | | |  \__ \_| | |_| | (_| |
--  \__,_|\__,_|\__\___/| .__/ \__,_|_|_|  |___(_)_|\__,_|\__,_|
--                      |_|                                     

-- ~/.config/nvim/lua/setup/autopairs.lua

local disable_filetype = { "TelescopePrompt" }
local disable_in_macro = false  -- disable when recording or executing a macro
local disable_in_visualblock = false -- disable when insert after visual block mode
local ignored_next_char = [=[[%w%%%'%[%"%.]]=]
local enable_moveright = true
local enable_afterquote = true  -- add bracket pairs after quote
local enable_check_bracket_line = true  --- check bracket in same line
local enable_bracket_in_quote = true --
local break_undo = true -- switch for basic rule break undo sequence
local check_ts = false
local map_cr = true
local map_bs = true  -- map the <BS> key
local map_c_h = false  -- Map the <C-h> key to delete a pair
local map_c_w = false -- map <c-w> to delete a pair if possible

local status_ok,autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    vim.notify = require('notify')
    vim.notify('Autopairs plugin load error!', 'error')
    return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
