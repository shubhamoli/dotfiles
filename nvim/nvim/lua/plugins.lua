--[[
--
-- Plugins.lua - Manage nvim plugins from here
--
--]]


-- Ensure packer is installed.
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

local packer = require('packer')

packer.init {
    max_jobs = 20,
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- Leave this empty for now
      }
    end
  }

  use { "ellisonleao/gruvbox.nvim" }
  use { "jacoborus/tender.vim" }
  use { "catppuccin/nvim", as = "catppuccin" }


  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- File Tree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    "neovim/nvim-lspconfig",
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- Smooth tmux / vim navigation
  use({
    "aserowy/tmux.nvim",
    config = function() require("tmux").setup() end
  })


  -- Git signs in the statusline
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end
  }

  -- Autopair
  use {
	  "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }

  -- surround helper
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Commenting plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- LuaSnip
  use({
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp"
  })


  -- vim-terraform
  use({
    "hashivim/vim-terraform",
  })

  -- go.nvim
  use {
    'ray-x/go.nvim',
    config = function ()
      require('go').setup()
    end
  }

  use 'ray-x/guihua.lua' -- required by go.nvim above
  
  use {
    'rust-lang/rust.vim'
  }




  ----------------------------------------
  -- Autosync packer
  -- Note: This needs to be at the bottom
  if packer_bootstrap then
    require('packer').sync()
  end
end)
