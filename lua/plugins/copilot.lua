return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = { enabled = true },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,        -- ms delay before suggestion
        keymap = {
          accept = "<C-j>",   -- accept suggestion inline
          next = "<C-]>",     -- optional: next suggestion
          prev = "<C-[>",     -- optional: previous suggestion
          dismiss = "<C-\\>", -- optional: dismiss suggestion
        },
      },
    })
  end
}
