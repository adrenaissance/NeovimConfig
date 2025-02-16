return {
  "williamboman/mason.nvim",
  lazy = true,
  config = function()
    require("mason").setup()
  end,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "nvim-telescope/telescope.nvim"
  },
  keys = {
    {"<leader>m", "<cmd>Mason<cr>", mode = "n", desc = "Open mason ui"}
  }
}

