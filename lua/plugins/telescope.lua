return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "target/",
        "__pycache__/",
        "build/",
        "%.o$",          -- ignore object files
        "%.pyc$",        -- ignore compiled python files
        "node_modules/", -- optional if you're doing JS
      },
    },
  },
  keys = {
    { "<leader>f",  "<cmd>Telescope find_files<cr>",  desc = "find files",  mode = "n" },
    { "<leader>gr", "<cmd>Telescope live_grep<cr>",   desc = "live_grep",   mode = "n" },
    { "<leader>tc", "<cmd>Telescope colorscheme<cr>", desc = "colorscheme", mode = "n" },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
      attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
          local entry = require("telescope.actions.state").get_selected_entry()
          require("telescope.actions").close(prompt_bufnr)
          vim.cmd.colorscheme(entry.value)
        end)
        return true
      end,
    },
  },

  ft = { "mason" },
}
