--           _     _      _     _                _             
-- __      _| |__ (_) ___| |__ | | _____ _   _  | |_   _  __ _ 
-- \ \ /\ / / '_ \| |/ __| '_ \| |/ / _ \ | | | | | | | |/ _` |
--  \ V  V /| | | | | (__| | | |   <  __/ |_| |_| | |_| | (_| |
--   \_/\_/ |_| |_|_|\___|_| |_|_|\_\___|\__, (_)_|\__,_|\__,_|
--                                       |___/                 

-- ~/.config/nvim/lua/setup/whichkey.lua

local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
    return
end

wk.setup{
    plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

wk.register({
    c = { '<cmd>checkhealth<cr>', 'Run Checkhealth' },
    f = {
        name = "Telescope",
        d = { "<cmd>Telescope diagnostics prompt_prefix=🔎\\ <cr>", "Diagnostics" },
        f = { "<cmd>Telescope find_files hidden=true prompt_prefix=🔎\\ <cr>", "Find File" },
        g = { "<cmd>Telescope live_grep hidden=true prompt_prefix=🔎\\ <cr>", "Live Grep" },
        h = { "<cmd>Telescope help_tags prompt_prefix=🔎\\ <cr>", "Help Tags" },
        k = { "<cmd>Telescope keymaps prompt_prefix=🔎\\ <cr>", "Keymaps" },
        l = { "<cmd>Telescope highlights prompt_prefix=🔎\\ <cr>", "Highlights" },
        o = { "<cmd>Telescope oldfiles prompt_prefix=🔎\\ <cr>", "Open Recent File", noremap=false },
        v = { "<cmd>Telescope vim_options prompt_prefix=🔎\\ <cr>", "Vim Options" },
    },
    h = {  '<cmd>split<cr>', 'Split Horizontal' },
    --l = {  '<cmd>w | !pdflatex %<cr>', 'Write/compile latex file' },
    l = {  '<cmd>Lazy sync<cr>', 'Lazy Sync' },
    n = {  '<cmd>Notifications<cr>', 'Notifications' },
    q = { '<cmd>qa<cr>', '[:qa] Quit All' },
    s = { '<cmd>w | so %<cr>', '[:w | so %] Write & Source All' },
    v = {  '<cmd>vsplit<cr>', 'Split Vertical' },
    w = { '<cmd>wa<cr>', '[:wa] Write All' },
    x = { '<cmd>xa<cr>', '[:xa] Write & Exit All' },
}, { prefix = "<leader>" })
