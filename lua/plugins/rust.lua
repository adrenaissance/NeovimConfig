return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended version
  lazy = false, -- Plugin is already lazy
  ft = "rust",
  dependencies = { "neovim/nvim-lspconfig" },
  keys = {
    { "gd", vim.lsp.buf.definition, desc = "Go to Definition", mode = "n" },
    { "gi", vim.lsp.buf.implementation, desc = "Go to Implementation", mode = "n" },
    { "K", vim.lsp.buf.hover, desc = "Hover Documentation", mode = "n" },
    { "<leader>d", vim.diagnostic.open_float, desc = "Show Diagnostics", mode = "n" }, -- Show diagnostics in a floating window
    { "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic", mode = "n" }, -- Jump to previous diagnostic
    { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic", mode = "n" } -- Jump to next diagnostic
  },

  config = function()
    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rs",
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
}
