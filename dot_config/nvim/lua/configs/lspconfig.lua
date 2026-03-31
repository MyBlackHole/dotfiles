require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "clangd", "rust_analyzer", "gopls", "pyright" }

vim.lsp.enable(servers)
