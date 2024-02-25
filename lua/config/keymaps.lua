-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- GitWork Trees
keymap.set("n", "<leader>tl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
keymap.set("n", "<leader>ta", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)

-- Removing some default keymaps
keymap.del("n", "[q", opts)
-- keymap.del("n", "<leader>ca", opts)
-- keymap.del("v", "<leader>ca", opts)
-- keymap.del("n", "<leader>cr", opts)

keymap.set("n", "<leader>a", function()
  vim.lsp.buf.code_action()
end, opts)
keymap.set("n", "<leader>r", function()
  vim.lsp.buf.rename()
end, opts)
-- keymap.set("n", "[w", "<Cmd>BufferLineCycleNext<CR>")
-- keymap.set("n", "[q", "<Cmd>BufferLineCycleNext<CR>")
--Quit buffer
keymap.set("n", "<C-q>", ":bdelete<CR>")
-- move highlighted line up or down
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up
-- yank/copy maps
-- keymap.set("n", "<leader>y", '"+y')
-- keymap.set("v", "<leader>y", '"+y')
-- keymap.set("n", "<leader>Y", '"+Y')

-- Diagnostics
keymap.set("n", "<leader>n", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<leader>p", function()
  vim.diagnostic.goto_prev()
end, opts)
