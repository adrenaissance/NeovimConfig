return {
  {
    "n1ghtmare/noirblaze-vim",
    priority = 1000,
    lazy = false,
  },
  {
    "yorickpeterse/vim-paper",
    priority = 1000,
    lazy = false,
    config = function() 
      local hour = tonumber(os.date("%H"))
      if hour > 16 then
        vim.cmd([[colorscheme noirblaze]])
      else
        vim.cmd([[colorscheme paper]])
      end 
    end,
  }
}
