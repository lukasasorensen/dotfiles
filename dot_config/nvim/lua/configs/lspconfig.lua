local servers = {
    html = {},
    cssls = {},
    ts_ls = {},
    jsonls = {},
    tailwindcss = {},
    bashls = {},
    lua_ls = {},
    dockerls = {},
    emmet_language_server = {},
    rust_analyzer = {}
}

for name, opts in pairs(servers) do
    vim.lsp.config(name, opts)
    vim.lsp.enable(name)
end

-- if you dont want to call the enable method in the loop, just pass a table.
-- vim.lsp.enable(vim.tbl_keys(servers))
-- vim.lsp.enable({"pyright", "clangd"})
