return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Neotree keymaps
    vim.keymap.set('n', '<leader>ee', ":Neotree filesystem reveal toggle left<CR>", {})
    vim.keymap.set('n', '<leader>ef', ":Neotree filesystem focus left<CR>", {})
  end
}

