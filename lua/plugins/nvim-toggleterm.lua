return {
  'akinsho/nvim-toggleterm.lua', 
  version='*', 
  config = function()
    require("toggleterm").setup{
      vsize = 20,
      open_mapping = [[<c-\>]],
      direction = 'horizontal',
    }
  end
}
