return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon.setup {
      settings = {
        save_on_toggle = false,
        save_on_change = true,
        excluded_filetypes = { "harpoon" },
        mark_branch = true,
      },
    }

    -- basic telescope configuration
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      local make_finder = function()
        local paths = {}

        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table {
          results = paths,
        }
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          -- this is not really working properly right now, needs further 
          -- investigation.
          attach_mappings = function(prompt_buffer_number, map)
            map("i", "<c-d>", function()
              local state = require "telescope.actions.state"
              local selected_entry = state.get_selected_entry()
              local current_picker =
                state.get_current_picker(prompt_buffer_number)

              harpoon:list():remove(selected_entry)
              current_picker:refresh(make_finder())
            end)

            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>hl", function()
      -- harpoon.ui:toggle_quick_menu(harpoon:list())
      toggle_telescope(harpoon:list())
    end)
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end)
    vim.keymap.set("n", "<leader>hr", function()
      harpoon:list():remove()
    end)
  end,
}
