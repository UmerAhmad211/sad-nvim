local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("hrsh7th/nvim-cmp")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-nvim-lsp")
	use("echasnovski/mini.tabline")
	use("stevearc/conform.nvim")
	use("blazkowolf/gruber-darker.nvim")
	use("projekt0n/github-nvim-theme")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("ibhagwan/fzf-lua")
	use("echasnovski/mini.statusline")
	use("axgfn/parchment")
	use("YorickPeterse/vim-paper")
	use("jaredgorski/Mies.vim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
