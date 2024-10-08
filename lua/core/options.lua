-- global options for our neovim config
local opt = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- session management
opt.sessionoptions =
"blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- terminal colors
opt.termguicolors = true

-- line numbering
opt.number = true
opt.relativenumber = true

-- Show ruler at 80 chars
opt.colorcolumn = "80"

-- Cursor Line
opt.cursorline = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 2

-- Set the mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- proper list item for markdown TOC
vim.g.vmt_list_item_char = "-"
vim.g.vmt_list_indent_text = "  "

-- Different Tabs etc for Python
vim.api.nvim_command [[autocmd FileType python set tabstop=4]]
vim.api.nvim_command [[autocmd FileType python set shiftwidth=4]]
vim.api.nvim_command [[autocmd FileType python set expandtab]]

vim.g.lazygit_floating_window_winblend = 8

-- Misc appearance settings
opt.signcolumn = "yes"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
}
