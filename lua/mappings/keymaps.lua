vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", function()
  local copilot = require("copilot.suggestion")
  if copilot.is_visible() then
    copilot.accept()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<C-j>", true, false, true),
      "n",
      false
    )
  end
end, { silent = true })
