--           _   _   _                   _             
--  ___  ___| |_| |_(_)_ __   __ _ ___  | |_   _  __ _ 
-- / __|/ _ \ __| __| | '_ \ / _` / __| | | | | |/ _` |
-- \__ \  __/ |_| |_| | | | | (_| \__ \_| | |_| | (_| |
-- |___/\___|\__|\__|_|_| |_|\__, |___(_)_|\__,_|\__,_|
--                           |___/                     

-- ~/.config/nvim/lua/setup/settings.lua

local set = vim.o

set.number = true
set.relativenumber = true
set.termguicolors = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.smartindent = true
-- Setting 'clipboard' to 'unnamedplus' disables register "0 - Bug with which-key - See issue 202 on github.
set.clipboard = 'unnamedplus'
set.pastetoggle = '<F6>'
set.timeoutlen = 1500
set.pumheight = 12
set.mouse = 'a'
set.completeopt = 'menu,menuone,noselect'
set.splitright = true
set.splitbelow = true
set.laststatus = 3
set.winbar = '%f%m%=Ascii %b/Hex %B'
set.listchars = 'eol:⮰,space:.,trail:+,tab:➱ '
set.ignorecase = true
set.smartcase = true
set.guifont = 'JetBrainsMono Nerd Font'
set.guifontwide = 'JetBrainsMono Nerd Font'
set.foldcolumn = 'auto:5'

-------------------- GLOBAL VARIABLES --------------------
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/usr/bin/python'

-------------------- ABBREVIATIONS --------------------
vim.cmd[[iab jbm JetBrainsMono Nerd Font]]
vim.cmd[[iab pb Phil Bevan]]
vim.cmd[[iab pbe phil@philbev.co.uk]]
vim.cmd[[iab pbg philbevan40@gmail.com]]
