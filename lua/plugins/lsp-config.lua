return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "emmet_language_server",
          "pyright",
          "eslint",
          "rust_analyzer",
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-tool-installer").setup {
        ensure_installed = {
          "stylua",
          "rubocop",
          "prettierd",
          "ruff",
          "mypy",
          "codelldb",
        },
      }

      -- set up an `on_attach` function.
      -- this will:
      --  1) Disable hover for `ruff`
      --  2) Enable file watching for all LSPs
      local on_attach = function(client, _)
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
        -- Enable file watching for the LSP
        -- if client.config.capabilities.workspace.didChangeWatchedFiles then
        --   client.notify("workspace/didChangeWatchedFiles", {})
        -- end
      end

      -- setup ruff for Python linting and formatting
      lspconfig.ruff.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- setup pyright for Python
      require("lspconfig").pyright.setup {
        on_attach = on_attach,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      }

      -- setup rust-analyzer for rust
      lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "rust" },
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      }

      -- set up lua-ls
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- ensure lua-ls recognizes the 'vim' global
              globals = { "vim" },
            },
          },
        },
      }
      -- setup javascript, typescript etc
      lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- setup eslint
      require("lspconfig")["eslint"].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- setup emmet integration
      lspconfig.emmet_language_server.setup {
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "pug",
          "typescriptreact",
        },
        -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
        -- **Note:** only the options listed in the table are supported.
        init_options = {
          ---@type table<string, string>
          includeLanguages = {},
          --- @type string[]
          excludeLanguages = {},
          --- @type string[]
          extensionsPath = {},
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
          preferences = {},
          --- @type boolean Defaults to `true`
          showAbbreviationSuggestions = true,
          --- @type "always" | "never" Defaults to `"always"`
          showExpandedAbbreviation = "always",
          --- @type boolean Defaults to `false`
          showSuggestionsAsSnippets = false,
          --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
          syntaxProfiles = {},
          --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
          variables = {},
        },
      }

      -- add some keymaps to use lsp functionality
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set(
        "n",
        "<leader>gd",
        vim.lsp.buf.definition,
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>gr",
        vim.lsp.buf.references,
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>ca",
        vim.lsp.buf.code_action,
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>rn",
        '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
}
