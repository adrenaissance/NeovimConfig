return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MunifTanjim/nui.nvim",
      version = "0.1.0", -- newer version does not work
    },
  },
  keys = {
    { "<leader>l", "<cmd>Neotree toggle position=float<cr>", noremap = true, mode = "n", desc = "Open tree" }
  },
  config = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          vim.cmd([[Neotree toggle position=float]])
        end
      end
    })
  end
}
