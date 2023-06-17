--            _            _              _             
--   ___ ___ | | ___  _ __(_)_______ _ __| |_   _  __ _ 
--  / __/ _ \| |/ _ \| '__| |_  / _ \ '__| | | | |/ _` |
-- | (_| (_) | | (_) | |  | |/ /  __/ | _| | |_| | (_| |
--  \___\___/|_|\___/|_|  |_/___\___|_|(_)_|\__,_|\__,_|
--                                                      

-- ~/.config/nvim/lua/setup/colorizer.lua

DEFAULT_OPTIONS = {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = false;        -- CSS rgb() and rgba() functions
	hsl_fn   = false;        -- CSS hsl() and hsla() functions
	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
  }

local status_ok,colorizer = pcall(require, 'colorizer')
if not status_ok then
    return
end

colorizer.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
  '*';
  html = {
    mode = 'foreground';
  }
}
