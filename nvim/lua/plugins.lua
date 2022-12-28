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

return require('packer').startup(function(use)
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


  ----------------------------------------
  -- Autosync packer
  -- Note: This needs to be at the bottom
  if packer_bootstrap then
    require('packer').sync()
  end
end)
