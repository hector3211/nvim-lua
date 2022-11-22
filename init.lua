vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
-- netr_w stuff
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- TABS
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No Wrap lines
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
-- The Primeagen settings
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50

-- MAP LEADER Key to space
vim.keymap.set("n", "<space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require('highlights')
require('plugins')
require('maps')


-- Theme
require("tokyonight").setup({
    style = "storm",
    -- transparent = true,
    terminal_colors = true
})
vim.cmd [[colorscheme tokyonight]]

-- Run gofmt + goimport on save
-- require('go').setup()

require("null-ls").setup({
    debug = true,
})

--Nvim tree
require("nvim-tree").setup()

-- Comments
require('nvim_comment').setup()

-- LuaLine
require('lualine').setup {}

--BufferLine
require("bufferline").setup {}

-- AutoPairs
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})

-- Prettier
local prettier = require("prettier")
prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})
