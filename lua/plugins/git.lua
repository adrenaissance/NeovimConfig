return {
  "tpope/vim-fugitive",
  lazy = true,
  keys = {
    { "<leader>gb", "<cmd>Git blame<cr>", mode = "n", desc = "Open git blame tree" },
    { "<leader>gs","<cmd>Git show<cr>", mode = "n", desc = "Git show" },
    { "<leader>gl","<cmd>Gclog<cr>", mode = "n", desc = "Git log commits" },
    { "<leader>gdv","<cmd>Gvdiffsplit<cr>", mode = "n", desc = "Git diff vertical split" },
    { "<leader>gdh","<cmd>Ghdiffsplit<cr>", mode = "n", desc = "Git diff horizontal split" },
 }
}
