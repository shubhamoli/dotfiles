--[[
-- 
-- Oli's init.lua for their neovim
--
-- Author - Shubham Oli <oli.shubham@gmail.com>
-- Date - 19/Dec/2022
-- Version - 0.0.1
--
--]]



require("options")
require("plugins")
require("keybindings")

-- Load LuaSnips
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/after/lua_snips"})

-- Set filetypes
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])


-- Misc.
--vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme catppuccin')

