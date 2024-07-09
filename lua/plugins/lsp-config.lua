return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "emmet_language_server",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim'
    },
    config = function()
      local lspconfig = require("lspconfig")

      require('mason-tool-installer').setup({
        ensure_installed = {
          'stylua',
          'rubocop',
          'prettier',
        }
      })

      -- set up lua-ls
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- ensure lua-ls recognizes the 'vim' global
              globals = {'vim'}
            },
          },
        },
      })
      -- setup javascript, typescript etc
      lspconfig.tsserver.setup({})

      -- add some keymaps to use lsp functionality
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
