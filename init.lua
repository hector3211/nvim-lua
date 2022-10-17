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

-- Typescript/ Javascript
require'lspconfig'.tsserver.setup {}
-- Tailwind
require'lspconfig'.tailwindcss.setup{}
-- CSS
require'lspconfig'.cssls.setup{}
--Astro
require'lspconfig'.astro.setup{}
-- Golang
require'lspconfig'.gopls.setup{}
-- RUST
require'lspconfig'.rust_analyzer.setup{}
-- Rust Tools
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

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
    "go",
    "rust"
  },
})

vim.filetype.add({
    extension = {
        astro = "astro"
    }
})
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
