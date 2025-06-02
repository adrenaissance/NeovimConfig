return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended version
  lazy = false, -- Plugin is already lazy
  ft = "rust",
  dependencies = { "neovim/nvim-lspconfig" },
  ---config = function()
  ---  vim.api.nvim_create_autocmd("BufWritePre", {
  ---    pattern = "*.rs",
  ---    callback = function()
  ---      vim.lsp.buf.format { async = false }
  ---    end,
  ---  })
  ---end,
}
