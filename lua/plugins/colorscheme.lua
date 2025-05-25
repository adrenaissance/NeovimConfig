return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      vim.o.background = "light"
      vim.cmd("colorscheme rose-pine")
    end
  },
}
