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

utils.nnoremap("<leader>x", ":bd!<cr>")

utils.nnoremap("<leader>y", '"+y')
utils.nnoremap("<leader>p", '"+p')
utils.xnoremap("<leader>y", '"+y')
utils.xnoremap("<leader>p", '"+p')

-- Toggle NeoTree
utils.nnoremap("<leader>e", ":NeoTreeShow<cr>")
utils.nnoremap("<leader>r", ":NeoTreeReveal<cr>")

-- Better indentation
utils.xnoremap('<', '<gv')
utils.xnoremap('>', '>gv')

