vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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
  use "EdenEast/nightfox.nvim"
  use "samjwill/nvim-unception"

  use({
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
          columns = { "icon" },
          keymaps = {
              ["<C-h>"] = false,
              ["<M-h>"] = "actions.select_split",
          },
          view_options = { show_hidden = true, },
      }

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir" })
    end,
  })
end)
