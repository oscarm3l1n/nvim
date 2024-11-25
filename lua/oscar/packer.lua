vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use{ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use{'williamboman/mason.nvim'}
  use{'williamboman/mason-lspconfig.nvim'}
  use({
      "ramojus/mellifluous.nvim",
      -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
      config = function()
          require("mellifluous").setup({}) -- optional, see configuration section.
          vim.cmd("colorscheme mellifluous")
      end,
  })
end)
