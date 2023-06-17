--                                    _             
--  _ __ ___   __ _ ___  ___  _ __   | |_   _  __ _ 
-- | '_ ` _ \ / _` / __|/ _ \| '_ \  | | | | |/ _` |
-- | | | | | | (_| \__ \ (_) | | | |_| | |_| | (_| |
-- |_| |_| |_|\__,_|___/\___/|_| |_(_)_|\__,_|\__,_|
--                                                  

-- ~/.config/nvim/lua/setup/mason.lua

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

local status_lsp,lspconfig = pcall(require, 'mason-lspconfig')
if not status_lsp then
    return
end

mason.setup()
lspconfig.setup({
    ensure_installed = { 'jedi_language_server', 'pylsp' }
})
