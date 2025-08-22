-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.encoding = "utf-8"
vim.opt.statuscolumn = ""
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.autoformat = false
vim.opt.winbar = "%=%m %f"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#74c7ec", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#cba6f7", bold = false })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#eba0ac", bold = false })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = false })
  end,
})
