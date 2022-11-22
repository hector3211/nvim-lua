local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' --Packer
  use 'folke/tokyonight.nvim' -- TokyoNight
  use 'nvim-tree/nvim-web-devicons' -- Web devicons
  use {
    'nvim-lualine/lualine.nvim', -- LuaLine
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Completion
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-cmdline' -- CMP Cmdline
  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' --LSP
  use 'williamboman/mason-lspconfig.nvim' -- mason lsp,formatter,linter installer

  -- Formatters
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'jayp0521/mason-null-ls.nvim' --Mason null formatter installer
  use 'MunifTanjim/prettier.nvim' -- prettier formatter
  -- use 'darrikonn/vim-gofmt' -- golang formatter
  -- use 'ray-x/go.nvim' -- golang everything
  -- use 'ray-x/guihua.lua' -- dont know

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip' --Lua Snip

  use 'nvim-telescope/telescope.nvim' -- telescope
  -- use 'nvim-telescope/telescope-file-browser.nvim' -- Telescope file browser

  use 'windwp/nvim-autopairs' -- AutoPairs
  use 'windwp/nvim-ts-autotag' -- Autotags
  use 'norcalli/nvim-colorizer.lua' -- Colorizer
  use({ 'akinsho/nvim-bufferline.lua', tag = "v2.*" }) -- BufferLine
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "terrortylor/nvim-comment" -- Comments
  use 'simrat39/rust-tools.nvim' -- Rust tools
  use 'lewis6991/gitsigns.nvim' -- GitSigns
  use 'nvim-lua/plenary.nvim' -- Plenary

end)
