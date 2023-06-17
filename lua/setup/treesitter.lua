--  _                      _ _   _            _             
-- | |_ _ __ ___  ___  ___(_) |_| |_ ___ _ __| |_   _  __ _ 
-- | __| '__/ _ \/ _ \/ __| | __| __/ _ \ '__| | | | |/ _` |
-- | |_| | |  __/  __/\__ \ | |_| ||  __/ | _| | |_| | (_| |
--  \__|_|  \___|\___||___/_|\__|\__\___|_|(_)_|\__,_|\__,_|
--                                                          

-- ~/.config/nvim/lua/setup/treesitter.lua

local status_ok,ts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    vim.notify = require('notify')
    vim.notify('Treesitter Error!',vim.log.levels.ERROR)
    return
end

ts.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'fish', 'bash' },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  ignore_install = { "" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = { '' },
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
        '#00ff00',
        '#00ffff',
        '#ff00ff',
        '#ffff00',
        '#ffffff',
        --'#ff0000',
        --'#0000ff',
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = {
      enable = true,
  }
}
