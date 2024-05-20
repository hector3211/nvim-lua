-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Harpoon
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

-- Map Oil to <leader>e
keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, opts)

-- Highlight on search, but clear on pressing <Esc> in normal mode
keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

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

-- Cycle buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
--Quit buffer
keymap.set("n", "<C-q>", ":bdelete<CR>", opts)
-- move highlighted line up or down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- up
-- yank/copy maps
-- keymap.set("n", "<leader>y", "''+y") -- for mac users
keymap.set("n", "<leader>y", "+y")
keymap.set("v", "<leader>y", "+y")
keymap.set("n", "<leader>Y", "+Y")

-- Diagnostics
keymap.set("n", "<leader>n", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<leader>p", function()
  vim.diagnostic.goto_prev()
end, opts)

-- Harpoon keybinds --
-- Open harpoon ui
keymap.set("n", "<leader>ho", function()
  harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
keymap.set("n", "<leader>ha", function()
  harpoon_mark.add_file()
end)

-- Remove current file from harpoon
keymap.set("n", "<leader>hr", function()
  harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
keymap.set("n", "<leader>hc", function()
  harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
keymap.set("n", "<leader>1", function()
  harpoon_ui.nav_file(1)
end)

keymap.set("n", "<leader>2", function()
  harpoon_ui.nav_file(2)
end)

keymap.set("n", "<leader>3", function()
  harpoon_ui.nav_file(3)
end)

keymap.set("n", "<leader>4", function()
  harpoon_ui.nav_file(4)
end)

keymap.set("n", "<leader>5", function()
  harpoon_ui.nav_file(5)
end)

-- TSC autocommand keybind to run TypeScripts tsc
keymap.set("n", "<leader>tc", ":TSC<cr>", { desc = "[T]ypeScript [C]ompile" })
