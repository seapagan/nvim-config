return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    local gitsigns = require('gitsigns')
    gitsigns.setup({})

    -- vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{} end)
  end
}
