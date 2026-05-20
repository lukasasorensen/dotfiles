-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local _map = vim.keymap.set

-- tmux/vim navigation
_map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left nvim+tmux" })
_map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right nvim+tmux" })
_map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down nvim+tmux" })
_map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up nvim+tmux" })

_map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
_map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
_map({ "n", "x", "v" }, "<leader>fw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
_map("n", "<leader>X", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
