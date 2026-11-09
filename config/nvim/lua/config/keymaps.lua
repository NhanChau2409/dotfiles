-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Karabiner turns Right Control + H/J/K/L into arrow keys globally. In Normal
-- mode, use those arrows to focus splits while preserving arrow movement in
-- Insert and Command-line modes.
vim.keymap.set("n", "<Left>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("n", "<Down>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("n", "<Up>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("n", "<Right>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
