local icons = require("lazyvim.config").icons
return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>" },
    },
    opts = {
      options = {
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "tokyonight",
      },
    },
    -- sections = {
    --   lualine_a = { "mode" },
    --   lualine_b = {
    --     "branch",
    --     {
    --       "diff",
    --       symbols = {
    --         added = icons.git.added,
    --         modified = icons.git.modified,
    --         removed = icons.git.removed,
    --       },
    --       source = function()
    --         local gitsigns = vim.b.gitsigns_status_dict
    --         if gitsigns then
    --           return {
    --             added = gitsigns.added,
    --             modified = gitsigns.changed,
    --             removed = gitsigns.removed,
    --           }
    --         end
    --       end,
    --     },
    --     "diagnostics",
    --     symbols = {
    --       error = icons.diagnostics.Error,
    --       warn = icons.diagnostics.Warn,
    --       info = icons.diagnostics.Info,
    --       hint = icons.diagnostics.Hint,
    --     },
    --   },
    -- },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
    ██████╗ ██████╗  █████╗ ███╗   ███╗ █████╗ ██████╗ ██████╗  ██╗
    ██╔══██╗██╔══██╗██╔══██╗████╗ ████║██╔══██╗╚════██╗╚════██╗███║
    ██║  ██║██████╔╝███████║██╔████╔██║███████║ █████╔╝ █████╔╝╚██║
    ██║  ██║██╔══██╗██╔══██║██║╚██╔╝██║██╔══██║ ╚═══██╗██╔═══╝  ██║
    ██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║██║  ██║██████╔╝███████╗ ██║
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
