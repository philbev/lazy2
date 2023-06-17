--  _ __   __ _  ___| | _____ _ __| |_   _  __ _ 
-- | '_ \ / _` |/ __| |/ / _ \ '__| | | | |/ _` |
-- | |_) | (_| | (__|   <  __/ | _| | |_| | (_| |
-- | .__/ \__,_|\___|_|\_\___|_|(_)_|\__,_|\__,_|
-- |_|                                           

-- ~/.config/nvim/lua/setup/packer.lua

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


local status_ok,packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init{
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}

return packer.startup(function()
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'kyazdani42/nvim-web-devicons'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind.nvim'
	use 'uga-rosa/cmp-dictionary'
	use 'hrsh7th/cmp-nvim-lua'
	use 'norcalli/nvim-colorizer.lua'
	use 'windwp/nvim-autopairs'
	use 'p00f/nvim-ts-rainbow'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'nvim-lualine/lualine.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'lifepillar/vim-gruvbox8'
	use 'navarasu/onedark.nvim'
	use 'RRethy/nvim-base16'
	use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x' }
	use 'MunifTanjim/nui.nvim'
	use 'folke/which-key.nvim'
	use 'akinsho/toggleterm.nvim'
	use 'tpope/vim-surround'
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	use 'rcarriga/nvim-notify'
	use 'rafamadriz/friendly-snippets'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-characterize'
	use 'ethanholz/nvim-lastplace'
	use 'folke/neodev.nvim'
    use 'j-hui/fidget.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'sainnhe/gruvbox-material'
    use({ "mtoohey31/cmp-fish", ft = "fish" })
	if packer_bootstrap then
		require('packer').sync()
	end
end)

