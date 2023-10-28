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
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars,*.hcl set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.cmd([[autocmd BufWritePost *.hcl silent !terragrunt hclfmt --terragrunt-hclfmt-file=@%]])


-- go.nvim
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})


-- Misc.
--vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme catppuccin')

vim.cmd([[highlight LineHighlight ctermbg=green guibg=darkgray]])

