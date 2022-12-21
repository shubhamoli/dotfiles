--[[
--
-- keybindings.lua - set personal keybindings
-- 
--]]


local utils = require("utils")


vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Move around windows (shifted to the right)
utils.nnoremap("<C-h>", "<C-w>h")
utils.nnoremap("<C-j>", "<C-w>j")
utils.nnoremap("<C-k>", "<C-w>k")
utils.nnoremap("<C-l>", "<C-w>l")

