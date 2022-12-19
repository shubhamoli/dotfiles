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

-- Telescope.nvim
local tele_builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>',tele_builtin.find_files, {})
vim.keymap.set('n', '<C-f>',tele_builtin.live_grep, {})
vim.keymap.set('n', '<C-b>',tele_builtin.buffers, {})


