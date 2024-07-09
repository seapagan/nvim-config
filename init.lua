-- import our global options
require("core.options")

-- set up 'lazy.nvim' package manager
require("core.lazy-nvim")
require("lazy").setup("plugins", {
    change_detection = {
      enabled = true,
      notify = false,
    },
})

-- import any custom keymaps
require("core.keymaps")
