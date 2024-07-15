return {
  "akinsho/nvim-toggleterm.lua",
  version = "*",
  config = function()
    require("toggleterm").setup {
      vsize = 10,
      open_mapping = [[<c-\>]],
      -- direction = 'horizontal',
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  end,
}
