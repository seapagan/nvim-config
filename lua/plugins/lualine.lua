return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'linrongbin16/lsp-progress.nvim'
  },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      }
    })
  end
}
