--[[
--
-- Set global vim options
--
--]]

vim.o.cmdheight = 1

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.breakindent = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.expandtab = true                   
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.termguicolors = true
vim.o.completeopt = 'menuone,noselect'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.scrolloff = 10
vim.o.updatetime = 50

vim.o.signcolumn = 'number'

vim.o.hidden = true
vim.o.fileencoding = "utf-8"


