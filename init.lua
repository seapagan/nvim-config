-- import our global options
require "core.options"

-- import any custom options
pcall(require, "core.custom-options")

-- set up 'lazy.nvim' package manager
require "core.lazy-nvim"
require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = true,
  },
  checker = {
    enabled = true,
    interval = 3600, -- check every hour
    notify = true,
  },
  ui = {
    border = "rounded",
  }
})

-- import any custom keymaps
require "core.keymaps"
