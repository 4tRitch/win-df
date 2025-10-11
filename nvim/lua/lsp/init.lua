-- Global Configuration of diagnostics
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  severity_sort = true,
  signs = false,
})

-- Load each configuration of LSP
require("lsp.csharp")
require("lsp.lua_lsp")
require("lsp.pws")
-- require("lsp.rust")
-- require("lsp.go")
-- require("lsp.clang")
-- require("lsp.cmake")
require("lsp.ts")
require("lsp.html")
require("lsp.css")


-- Start each LSP
vim.lsp.enable("csharp_ls")
vim.lsp.enable("powershell_es")
vim.lsp.enable("ts_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")






-- lua print(vim.inspect(vim.lsp.get_clients()))



