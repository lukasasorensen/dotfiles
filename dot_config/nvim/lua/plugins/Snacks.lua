return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>e",
      function()
        local pickers = Snacks.picker.get({ source = "explorer" })
        if #pickers > 0 then
          pickers[1]:focus("list")
        else
          Snacks.explorer.open({ cwd = LazyVim.root() })
        end
      end,
      desc = "Explorer (Open & Focus)",
    },
    {
      "<leader>E",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer (Toggle)",
    },
  },
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
