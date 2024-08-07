require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local live_grep_args_shortcuts = require "telescope-live-grep-args.shortcuts"

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fc", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Telescope Find Word Under Cursor" })
map("v", "<leader>fv", live_grep_args_shortcuts.grep_visual_selection, { desc = "Telescope Grep for Visual Selection" })
map("v", "<leader>cp", [["+y]], { desc = "Copy to Clipboard" })
map("n", "<leader>tr", "<cmd>Telescope resume<cr>", { desc = "Telescope resume last search" })
map("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>fr", ":%s/<C-r><C-w>/", { desc = "Find and Replace" })
map("v", "<leader>fr", "y:%s/<C-r>\"/", { desc = "Find and Replace" })
map("n", "<leader>!", ":qa!<cr>", { desc = ":qa!" })
map("n", "<leader>q", ":q<cr>", { desc = ":q" })


-- harpoon
local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

map("n", "<leader>a", function () harpoon:list():add() end, { desc = "Add Harpoon"})
map("n", "<leader>m", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon List"})
map("n", "<leader>jj", function () harpoon:list():select(1) end, { desc = "Harpoon Jump to 1"})
map("n", "<leader>jk", function () harpoon:list():select(2) end, { desc = "Harpoon Jump to 2"})
map("n", "<leader>jl", function () harpoon:list():select(3) end, { desc = "Harpoon Jump to 3"})
map("n", "<leader>j;", function () harpoon:list():select(4) end, { desc = "Harpoon Jump to 4"})

-- tmux/vim navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left nvim+tmux" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right nvim+tmux" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down nvim+tmux" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up nvim+tmux" })
