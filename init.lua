vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
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
vim.g.mapleader = ' '

require('highlights')
require('plugins')
require('maps')


-- Theme
vim.cmd [[colorscheme tokyonight]]

-- Comments
require('nvim_comment').setup()

-- Nvim Tree
require("nvim-tree").setup()

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
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})

-- Astro Treesitter work around
vim.filetype.add({
    extension = {
        astro = "astro"
    }
})
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
