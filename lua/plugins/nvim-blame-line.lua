return {
  'tveskag/nvim-blame-line',
  config = function ()
    vim.keymap.set("n", "<leader>gb", ":ToggleBlameLine<CR>")
  end
}
