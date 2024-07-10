return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require "nvim-treesitter.configs"
    config.setup {
      ensure_installed = {
        "bash",
        "lua",
        "html",
        "css",
        "scss",
        "json",
        "javascript",
        "python",
        "regex",
        "markdown",
        "toml",
        "typescript",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
