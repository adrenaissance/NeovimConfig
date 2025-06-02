return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    -- Load saved colorscheme if available
    local file = vim.fn.stdpath("config") .. "/colorscheme.txt"
    local ok, lines = pcall(vim.fn.readfile, file)
    if ok and lines and lines[1] then
      pcall(vim.cmd.colorscheme, lines[1])
    else
      -- Fallback to rose-pine if no saved scheme
      vim.cmd.colorscheme("rose-pine")
    end
  end,
}
