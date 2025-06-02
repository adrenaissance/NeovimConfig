return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Explorer", mode = "n" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
