return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- telescope keymaps
      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set(
        "n",
        "<leader>fF",
        "<cmd>lua require('telescope.builtin').find_files({ search_dirs = {'~/work/own'} })<CR>",
        { noremap = true, silent = true }
      )
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set(
        "n",
        "<leader>fG",
        "<cmd>lua require('telescope.builtin').live_grep({ search_dirs = {'~/work/own'} })<CR>",
        { noremap = true, silent = true }
      )

      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set(
        "n",
        "<leader>fk",
        require("telescope.builtin").keymaps,
        {}
      )
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
          ["repo"] = {
            list = {
              search_dirs = {
                "~/work",
              },
            },
          },
        },
      }
      require("telescope").load_extension "ui-select"
      require("telescope").load_extension "noice"
    end,
  },
}
