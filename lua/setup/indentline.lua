--  _           _            _   _ _              _             
-- (_)_ __   __| | ___ _ __ | |_| (_)_ __   ___  | |_   _  __ _ 
-- | | '_ \ / _` |/ _ \ '_ \| __| | | '_ \ / _ \ | | | | |/ _` |
-- | | | | | (_| |  __/ | | | |_| | | | | |  __/_| | |_| | (_| |
-- |_|_| |_|\__,_|\___|_| |_|\__|_|_|_| |_|\___(_)_|\__,_|\__,_|
--                                                              

-- ~/.config/nvim/lua/setup/indentline.lua

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

local status_ok,indentline = pcall(require, 'indent_blankline')
if not status_ok then
    return
end

indentline.setup {
    show_current_context = true,
    show_current_context_start = true,
    --space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
