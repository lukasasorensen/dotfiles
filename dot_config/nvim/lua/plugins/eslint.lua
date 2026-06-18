return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        on_new_config = function(config, new_root_dir)
          local has_flat = vim.fn.glob(new_root_dir .. "/eslint.config.{js,mjs,cjs,ts,mts,cts}") ~= ""
          local has_legacy = vim.fn.glob(new_root_dir .. "/.eslintrc*") ~= ""
          if has_legacy and not has_flat then
            config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
              useFlatConfig = false,
              experimental = { useFlatConfig = false },
            })
          end
        end,
      },
    },
  },
}
