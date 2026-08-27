vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load flatten.nvim first and eagerly (no cmd/event/module triggers below)
  -- so it's ready before any other plugin might spawn a nested nvim.
  use({
    "willothy/flatten.nvim",
    config = function()
      require("flatten").setup {
        -- defaults already block for gitcommit/gitrebase; but the default
        -- window.open = "current" reuses whatever window you're in, so
        -- finishing with :wq closes that window -- if it was the only one,
        -- that quits nvim entirely. Force a vsplit so a window is always
        -- left behind.
        window = { open = "vsplit" },
      }
    end,
  })

  -- Lets you use normal-mode vim bindings (i, a, dd, cw, p, x, r, ...) to
  -- edit the shell command you're typing inside a :terminal buffer, instead
  -- of being stuck sending every keystroke straight to the shell. Requires
  -- prompt_end to match the tail of the shell prompt -- see the $NVIM check
  -- in ~/.bashrc that swaps to a plain "$ " prompt for this to match reliably.
  use({
    "chomosuke/term-edit.nvim",
    config = function()
      require("term-edit").setup {
        prompt_end = "%$ ",
      }
    end,
  })

  use{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
	  'nvim-telescope/telescope.nvim', branch = 'master',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use{'williamboman/mason.nvim'}
  use{'williamboman/mason-lspconfig.nvim'}
  use "EdenEast/nightfox.nvim"

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
