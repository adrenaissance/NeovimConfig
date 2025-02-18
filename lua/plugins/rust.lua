return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended version
  lazy = false, -- Plugin is already lazy
  ft = "rust",
  dependencies = { "neovim/nvim-lspconfig" },
  keys = {
    { "gd", vim.lsp.buf.definition, desc = "Go to Definition", mode = "n" },
    { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation", mode = "n" },
    { "K", vim.lsp.buf.hover, desc = "Hover Documentation", mode = "n" }
  }
}
