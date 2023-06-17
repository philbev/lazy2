--  _       _                                  _             
-- | |_ ___| | ___  ___  ___ ___  _ __   ___  | |_   _  __ _ 
-- | __/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \ | | | | |/ _` |
-- | ||  __/ |  __/\__ \ (_| (_) | |_) |  __/_| | |_| | (_| |
--  \__\___|_|\___||___/\___\___/| .__/ \___(_)_|\__,_|\__,_|
--                               |_|                         

-- ~/.config/nvim/lua/setup/telescope.lua

local status_ok,telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
      fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
