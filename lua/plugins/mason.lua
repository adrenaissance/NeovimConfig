return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    lazy = true,
    config = function()
      require("mason").setup({
        automatic_update = false,
      })
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "nvim-telescope/telescope.nvim"
    },
    keys = {
      { "<leader>m", "<cmd>Mason<cr>", mode = "n", desc = "Open mason ui" }
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "terraformls", "gopls" },
      })
    end,
  },

}
