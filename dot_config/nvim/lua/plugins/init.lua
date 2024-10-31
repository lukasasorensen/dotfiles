return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      require("telescope").load_extension "live_grep_args"

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    lazy = true,
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    init = function()
      vim.cmd "let g:minimap_width = 10"
      vim.cmd "let g:minimap_auto_start = 0"
      vim.cmd "let g:minimap_auto_start_win_enter = 0"
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    lazy = false,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neoclide/coc.nvim",
    enabled = false,
    lazy = false,
    branch = "release",
    config = function()
      require("configs.coc").config()
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require "transparent"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "pangloss/vim-javascript",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "json-lsp",
        "eslint-lsp",
        "tsserver",
      },
    },
  },
  {
    "dense-analysis/ale",
    lazy = false,
    config = function()
      -- Configuration goes here.
      local g = vim.g
      g.ale_linters = {
        javascript = { "eslint" },
        typescript = { "eslint" },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "tsx",
      },
      autotag = {
        enable = true,
      },
    },
  },
  {
    "https://github.com/tpope/vim-sleuth",
    event = "BufRead",
  },
  {
    "https://github.com/xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {},
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
    init = function()
      local g = vim.g
      g.VM_default_mappings = 0
      g.VM_maps = {
        ["Find Under"] = "<C-f>",
        ["Find Subword Under"] = "<C-f>",
      }
    end,
  },
  {
    "mtth/scratch.vim",
    cmd = "Scratch",
  },
  {
    "echasnovski/mini.move",
    lazy = true,
    keys = {
      { "<M-j>", desc = "mini.move selection down", mode = "v" },
      { "<M-k>", desc = "mini.move selection up", mode = "v" },
      { "<M-h>", desc = "mini.move selection left", mode = "v" },
      { "<M-l>", desc = "mini.move selection right", mode = "v" },
      { "<M-j>", desc = "mini.move selection down", mode = "n" },
      { "<M-k>", desc = "mini.move selection up", mode = "n" },
      { "<M-h>", desc = "mini.move selection left", mode = "n" },
      { "<M-l>", desc = "mini.move selection right", mode = "n" },
    },
    version = "*",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    lazy = true,
    version = "*",
    keys = {
      { "sa", desc = "add surrounding in", mode = "n" },
      { "sd", desc = "delete surrounding", mode = "n" },
      { "sf", desc = "find surround to the right", mode = "n" },
      { "sF", desc = "find surround to the left", mode = "n" },
      { "sr", desc = "replace surrounding", mode = "n" },
      { "sa", desc = "add surrounding", mode = "v" },
      { "sd", desc = "delete surrounding", mode = "v" },
      { "sf", desc = "find surround to the right", mode = "v" },
      { "sF", desc = "find surround to the left", mode = "v" },
      { "sr", desc = "replace surrounding", mode = "v" },
    },
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "arthurxavierx/vim-caser",
    lazy = true,
    version = "*",
    keys = {
      { "gsm", desc = "convert to MixedCase", mode = "v" },
      { "gsc", desc = "convert to camelCase", mode = "v" },
      { "gs_", desc = "convert to snake_case", mode = "v" },
      { "gsu", desc = "convert to UPPER_CASE", mode = "v" },
      { "gst", desc = "convert to Title Case", mode = "v" },
      { "gss", desc = "convert to Sentence case", mode = "v" },
      { "gs-", desc = "convert to dash-case", mode = "v" },
      { "gs.", desc = "convert to dot.case", mode = "v" },
      { "gs<space>", desc = "convert to space case", mode = "v" },
    },
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    lazy = true,
    keys = {
      { "<leader>fs", desc = "find snippet", mode = "n" },
    },
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "op read op://private/chatgpt/apikey --no-newline",
        openai_params = {
          model = "gpt-4o-mini",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 3000,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "gpt-4o-mini",
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          max_tokens = 3000,
          top_p = 1,
          n = 1,
        },
      }
    end,
    lazy = true,
    keys = {
      { "<leader>gpt", mode = { "n", "v" }, "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      { "<leader>gpe", mode = { "n", "v" }, "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
      { "<leader>gpg", mode = { "n", "v" }, "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
      { "<leader>gpa", mode = { "n", "v" }, "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
      { "<leader>gpk", mode = { "n", "v" }, "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
      { "<leader>gpd", mode = { "n", "v" }, "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
      { "<leader>gps", mode = { "n", "v" }, "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
      { "<leader>gpo", mode = { "n", "v" }, "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
      { "<leader>gpm", mode = { "n", "v" }, "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
      { "<leader>gpb", mode = { "n", "v" }, "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
      { "<leader>gpx", mode = { "n", "v" }, "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
      {
        "<leader>gpr",
        mode = { "n", "v" },
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        desc = "Readability Analysis",
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },
}
