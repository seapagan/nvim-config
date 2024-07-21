return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  config = function ()
    require("barbecue").setup()

    -- keymaps
    vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", { silent = true, noremap = true })
    -- delete all buffers except the current one
    vim.keymap.set("n", "<Leader>bD", ":%bd<bar>e#<bar>bd#<CR><bar>'\"", { silent = true, noremap = true })
  end
}
