return {
  {
    "cocopon/iceberg.vim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme iceberg")
    end
  },
}
