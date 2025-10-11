local M = require("lsp.utils")

local bin_ext = M.get_bin_ext()
local bin_path = M.get_bin_path()
local css_path = bin_path .. "vscode-css-language-server" .. bin_ext


---@type vim.lsp.Config
return {
  cmd = { css_path, '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  root_markers = { 'package.json', '.git' },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
