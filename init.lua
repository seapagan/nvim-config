require("core.options")
require("core.lazy")
require("lazy").setup("plugins", {
    change_detection = {
      enabled = true,
      notify = false,
    },
})
require("core.keymaps")
