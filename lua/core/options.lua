-- global options for our neovim config
local opt = vim.opt

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
vim.bo.softtabstop = 2

-- Set the mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Different Tabs etc for Python
vim.api.nvim_command([[autocmd FileType python set tabstop=4]])
vim.api.nvim_command([[autocmd FileType python set shiftwidth=4]])
vim.api.nvim_command([[autocmd FileType python set expandtab]])

-- Misc appearance settings
opt.signcolumn = "yes"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}
