-- Use a loop to conveniently call 'setup' on multiple servers
local lsp_servers = {}
-- python
lsp_servers["pyright"] = require'lsp.pyright_opts'
-- rust
lsp_servers["rust_analyzer"] = require'lsp.rust_analyzer_opts'
-- c cpp
lsp_servers["clangd"] = require'lsp.clangd_opts'
-- cmake
lsp_servers["cmake"] = require'lsp.cmake_opts'
-- shell
lsp_servers["bashls"] = require'lsp.bashls_opts'
-- lua
lsp_servers["sumneko_lua"] = require'lsp.lua_opts'

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer_servers = require'nvim-lsp-installer.servers'
-- pairs hash遍历，ipairs 必须以1开始遍历到不连续为止
for lsp_name, lsp_opts in pairs(lsp_servers) do
  local server_available, requested_server = lsp_installer_servers.get_server(lsp_name)
  if server_available then
    requested_server:on_ready(function ()
      -- map buffer local keybindings when the language server attaches
      lsp_opts.on_attach = require('key_mapping').lsp_keymap_common
      lsp_opts.flags = { debounce_text_changes = 150 }
      lsp_opts.capabilities = capabilities
      requested_server:setup(lsp_opts)
      -- print("Setup lsp" .. lsp_name)
    end)

    if not requested_server:is_installed() then
      -- Queue the server to be installed
      -- print("Installing " .. lsp_name)
      requested_server:install()
    end
  end
end

