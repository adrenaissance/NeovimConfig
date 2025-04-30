return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").dockerls.setup({
      cmd = { "docker-langserver", "--stdio" }, -- Command to start the Docker LSP
      filetypes = { "Dockerfile", "dockerfile" }, -- Enable for Dockerfile types
      root_dir = function(startpath)
        return require("lspconfig.util").find_git_ancestor(startpath) or vim.loop.os_homedir()
      end
    })
    local opts = { noremap = true, silent = true, desc = "LSP Action" }
  end
}
