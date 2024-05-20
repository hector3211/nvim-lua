return {
  "stevearc/oil.nvim",
  -- keys = {
  --   {
  --     "<leader>e",
  --     function()
  --       require("oil").open_float()
  --     end,
  --     silent = true,
  --   },
  -- },
  opts = {
    keymaps = {
      ["<S-h>"] = "actions.toggle_hidden",
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
