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
        "typescript-language-server",
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
    version = false,
    config = function()
      require("mini.move").setup()
    end,
  },
}
