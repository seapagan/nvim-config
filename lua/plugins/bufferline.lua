return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, _, _)
        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,
    },
  },
  config = function(_,opts)
    require("bufferline").setup(opts)
  end,
}
