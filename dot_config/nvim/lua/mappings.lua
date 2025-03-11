require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local live_grep_args_shortcuts = require "telescope-live-grep-args.shortcuts"
local telescope_builtin = require "telescope.builtin"

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fc", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Telescope Find Word Under Cursor" })
map("v", "<leader>fv", live_grep_args_shortcuts.grep_visual_selection, { desc = "Telescope Grep for Visual Selection" })
map('n', '<leader>,', telescope_builtin.buffers, { desc = 'Telescope buffers' })
map("v", "<leader>cp", [["+y]], { desc = "Copy to Clipboard" })
map("n", "<leader>tr", "<cmd>Telescope resume<cr>", { desc = "Telescope resume last search" })
map("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>fr", ":%s/<C-r><C-w>/", { desc = "Find and Replace" })
map("v", "<leader>fr", 'y:%s/<C-r>"/', { desc = "Find and Replace" })
map("n", "<leader>!", ":qa!<cr>", { desc = ":qa!" })
map("n", "<leader>q", ":q<cr>", { desc = ":q" })
map("n", "<leader>cb", ":%bd!<cr>", { desc = "Clear All Buffers" })
map("n", "<leader>fs", "<cmd>Telescope luasnip<cr>", { desc = "Telescope find snippet" })

-- harpoon
local harpoon = require "harpoon"

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add Harpoon" })
map("n", "<leader>m", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon List" })
map("n", "<leader>jj", function()
  harpoon:list():select(1)
end, { desc = "Harpoon Jump to 1" })
map("n", "<leader>jk", function()
  harpoon:list():select(2)
end, { desc = "Harpoon Jump to 2" })
map("n", "<leader>jl", function()
  harpoon:list():select(3)
end, { desc = "Harpoon Jump to 3" })
map("n", "<leader>j;", function()
  harpoon:list():select(4)
end, { desc = "Harpoon Jump to 4" })

-- tmux/vim navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window Left nvim+tmux" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window Right nvim+tmux" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window Down nvim+tmux" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window Up nvim+tmux" })

-- ChatGPT
-- map({ "n", "v" }, "<leader>gpt", "<cmd>ChatGPT<CR>", { desc = "ChatGPT" })
-- map({ "n", "v" }, "<leader>gpe", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
-- map({ "n", "v" }, "<leader>gpg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction" })
-- map({ "n", "v" }, "<leader>gpa", "<cmd>ChatGPTRun translate<CR>", { desc = "Translate" })
-- map({ "n", "v" }, "<leader>gpk", "<cmd>ChatGPTRun keywords<CR>", { desc = "Keywords" })
-- map({ "n", "v" }, "<leader>gpd", "<cmd>ChatGPTRun docstring<CR>", { desc = "Docstring" })
-- map({ "n", "v" }, "<leader>gps", "<cmd>ChatGPTRun add_tests<CR>", { desc = "Add Tests" })
-- map({ "n", "v" }, "<leader>gpo", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "Optimize Code" })
-- map({ "n", "v" }, "<leader>gpm", "<cmd>ChatGPTRun summarize<CR>", { desc = "Summarize" })
-- map({ "n", "v" }, "<leader>gpb", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs" })
-- map({ "n", "v" }, "<leader>gpx", "<cmd>ChatGPTRun explain_code<CR>", { desc = "Explain Code" })
-- map({ "n", "v" }, "<leader>gpr", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "Readability Analysis" })
