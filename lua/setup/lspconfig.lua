--  _                            __ _         _             
-- | |___ _ __   ___ ___  _ __  / _(_) __ _  | |_   _  __ _ 
-- | / __| '_ \ / __/ _ \| '_ \| |_| |/ _` | | | | | |/ _` |
-- | \__ \ |_) | (_| (_) | | | |  _| | (_| |_| | |_| | (_| |
-- |_|___/ .__/ \___\___/|_| |_|_| |_|\__, (_)_|\__,_|\__,_|
--       |_|                          |___/                 

-- ~/.config/nvim/lua/setup/lspconfig.lua

require('neodev').setup()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities,
	settings = {
		Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
			diagnostics = {
				globals = { 'vim', 'use' }
			},
		}
	}
}

require('lspconfig')['jedi_language_server'].setup{
    capabilities = capabilities
}

require('lspconfig')['bashls'].setup{
    capabilities = capabilities
}

require('lspconfig')['marksman'].setup{
    capabilities = capabilities
}

--require('lspconfig')['ltex'].setup{
--    capabilities = capabilities
--}
