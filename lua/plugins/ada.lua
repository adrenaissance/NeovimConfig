return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").als.setup {
        settings = {
          ada = {
            projectFile = "project.gpr",
            scenarioVariables = {
              BUILD_MODE = "debug",
              TARGET = "native"
            },
          },
        },
      }
    end,
  },
}

