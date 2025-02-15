return {
  'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = { },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "find files", mode = "n" }
  },
  ft = { "mason" },
}
