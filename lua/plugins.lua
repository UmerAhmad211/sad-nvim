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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.7',
   requires = { {'nvim-lua/plenary.nvim'} }
}
	use { "ntk148v/habamax.nvim", requires={ "rktjmp/lush.nvim" } }
	use "ramojus/mellifluous.nvim"
	use "cpwrs/americano.nvim"
	use {
     'nvim-treesitter/nvim-treesitter',
      run = function()
         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
         ts_update()
    end,
}
	use "echasnovski/mini.statusline"
	use "echasnovski/mini.tabline"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "rafamadriz/friendly-snippets"
	use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
