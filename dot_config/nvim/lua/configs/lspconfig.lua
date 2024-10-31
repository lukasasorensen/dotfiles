-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "tsserver",
  "jsonls",
  "tailwindcss",
  "bashls",
  "lua_ls",
  "dockerls",
  "emmet_language_server",
  "rust_analyzer",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "tsserver" then
    lsp = "ts_ls"
  end
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
