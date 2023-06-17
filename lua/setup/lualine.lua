--  _             _ _              _             
-- | |_   _  __ _| (_)_ __   ___  | |_   _  __ _ 
-- | | | | |/ _` | | | '_ \ / _ \ | | | | |/ _` |
-- | | |_| | (_| | | | | | |  __/_| | |_| | (_| |
-- |_|\__,_|\__,_|_|_|_| |_|\___(_)_|\__,_|\__,_|
--                                               

-- ~/.config/nvim/lua/setup/lualine.lua

local ok,lualine = pcall(require, 'lualine')
if not ok then
    return
end

local spell = function ()
    if vim.o.spell then
        return 'Spell'
    else
        return ''
    end
end

local paste = function ()
    if vim.o.paste then
        return 'Paste'
    else
        return ''
    end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode', spell, paste},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
