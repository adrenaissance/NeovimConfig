return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "target/",
        "__pycache__/",
        "build/",
        "%.o$",       -- ignore object files
        "%.pyc$",     -- ignore compiled python files
        "node_modules/", -- optional if you're doing JS
      },
    },
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "find files", mode = "n" }
  },
  ft = { "mason" },
}

