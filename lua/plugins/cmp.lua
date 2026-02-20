return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
      })
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
    end
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    'hrsh7th/cmp-cmdline',
  }
}
