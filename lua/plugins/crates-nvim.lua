return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  tag = "stable",
  config = function()
    require("crates").setup {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
      completion = {
        cmp = {
          enabled = true,
        },
        crates = {
          enabled = true,
          max_results = 8,
          min_chars = 3,
        },
      },
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    }
  end,
}
