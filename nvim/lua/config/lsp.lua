require("mason").setup()
require("lsp")


require("mason-lspconfig").setup {
 automatic_enable = {
    "lua_ls",
    "csharp_ls",
    "powershell_es",
    -- "rust_analyzer",
    -- "gopls",
    -- "clangd",
    "html",
    "ts_ls"
  },
  ensure_installed = {
    "lua_ls",
    "csharp_ls",
    -- "rust_analyzer",
    -- "gopls",
    -- "clangd",
    -- "tsserver"
  },
}

