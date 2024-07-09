require("lua.core.options")
require("lua.core.lazy")
require("lazy").setup("plugins", {
    change_detection = {
      enabled = true,
      notify = false,
    },
})
require("lua.core.keymaps")
