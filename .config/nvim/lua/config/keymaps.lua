-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select and replace:
vim.keymap.set("n", "S", ":%s//gI<Left><Left><Left>")

-- Format JSON with jq:
vim.keymap.set("n", "<leader>cj", ":%!jq .<CR>", { noremap = true, silent = true, desc = "Format JSON with jq" })
