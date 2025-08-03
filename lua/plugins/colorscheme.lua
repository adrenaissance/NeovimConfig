-- Path to the file storing scheme + background
local file = vim.fn.stdpath("config") .. "/colorscheme.txt"

-- Save current colorscheme and background to file
local function save_colorscheme_and_background()
  local scheme = vim.g.colors_name or "rose-pine"
  local background = vim.o.background or "dark"
  vim.fn.writefile({ scheme, background }, file)
end

-- Define :ToggleBackground command
vim.api.nvim_create_user_command("ToggleBackground", function()
  vim.o.background = (vim.o.background == "dark") and "light" or "dark"
  save_colorscheme_and_background()
  print("Toggled background to: " .. vim.o.background)
end, {})

-- Plugin config that loads saved scheme + background
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      local ok, lines = pcall(vim.fn.readfile, file)
      local scheme = (ok and lines and lines[1]) or "rose-pine"
      local background = (ok and lines and lines[2]) or "dark"

      vim.o.background = background
      pcall(vim.cmd.colorscheme, scheme)
    end,
  },
  {
    "huyvohcmc/atlas.vim",
    name = "noir"
  },
  {
    "e-ink-colorscheme/e-ink.nvim",
    name = "ink",
    priority = 1000,
  },
}
