return {
  'nvim-treesitter/nvim-treesitter',
  lazy = true,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "json",
      },
      highlight = { enable = false },
      indent = { enable = true },
    })
  end
}
