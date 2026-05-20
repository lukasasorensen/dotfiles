return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      win = {
        list = {
          keys = {
            -- old value: ["o"] = "explorer_open",
            ["o"] = "confirm",
            ["O"] = "explorer_open",
          },
        },
      },
    },
    picker = {
      sources = {
        explorer = {
          auto_close = false,
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
          win = {
            list = {
              keys = {
                -- old value: ["o"] = "explorer_open",
                ["o"] = "confirm",
                ["O"] = "explorer_open",
              },
            },
          },
        },
      },
    },
  },
}
