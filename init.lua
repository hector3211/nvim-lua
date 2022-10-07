vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.smarttab = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
vim.opt.title =true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10

require('highlights')
require('plugins')
require('maps')

require'lspconfig'.tsserver.setup {}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.astro.setup{}
require'lspconfig'.gopls.setup{}

-- Theme
vim.cmd[[colorscheme tokyonight]]

-- Comments
require('nvim_comment').setup()

-- Nvim Tree 
require("nvim-tree").setup()

-- LuaLine
require('lualine').setup()

--BufferLine
require("bufferline").setup{}


-- AutoPairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

--CMP

local cmp = require'cmp'
cmp.setup ({
    mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Esc>'] = cmp.mapping.close(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
        }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Mason
require("mason").setup()

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


-- Treesitter
require("nvim-treesitter.configs").setup{highlight={enable=true},autotag={enable=true}}

