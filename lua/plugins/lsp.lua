local pid = vim.fn.getpid()

vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.config['yamlls'] = {
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}

vim.lsp.config['omnisharp'] = {
  cmd = {
    "OmniSharp",
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
}


vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unusedvariables = true,
        unreachable = true,
        QF1002 = true,
        S1005 = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  }
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })

    vim.lsp.enable('luals')
    vim.lsp.enable('gopls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('yamlls')
    vim.lsp.enable('biome')
    vim.lsp.enable('omnisharp')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
          -- Create a keymap for vim.lsp.buf.implementation ...
        end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              -- buf_request_sync defaults to a 1000ms timeout. Depending on your
              -- machine and codebase, you may want longer. Add an additional
              -- argument after params if you find that you have to write the file
              -- twice for changes to be saved.
              -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
              for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                  end
                end
              end
              vim.lsp.buf.format({ async = true })
            end
          })
        end
      end,
    })
  end,
}
