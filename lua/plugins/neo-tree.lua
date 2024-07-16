return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = false,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
            ".mypy_cache",
            ".pytest_cache",
            "__pycache__",
            ".ruff_cache",
          },
        },
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
      hijack_netrw_behavior = "open_default",
    }
    -- Neotree keymaps
    vim.keymap.set(
      "n",
      "<leader>ee",
      ":Neotree filesystem reveal toggle left<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      "<leader>ef",
      ":Neotree filesystem focus left<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set(
      "n",
      "<leader>eg",
      ":wincmd l<CR>",
      { silent = true, noremap = true }
    )
  end,
}
