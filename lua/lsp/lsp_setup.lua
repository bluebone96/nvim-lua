-- Use a loop to conveniently call 'setup' on multiple servers
local lsp_servers = {} -- python
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

      -- for rust-tools
      if requested_server.name == "rust_analyzer" then
        local rustopts = {
          tools = {
            autoSetHints = true,
            hover_with_actions = false,
            inlay_hints = {
              show_parameter_hints = true,
              parameter_hints_prefix = "",
              other_hints_prefix = "",
            },
          },

          server = vim.tbl_deep_extend("force", requested_server:get_default_options(), lsp_opts, {
            settings = {
              ["rust-analyzer"] = {
                completion = {
                  postfix = {
                    enable = false
                  }
                },
                checkOnSave = {
                  command = "clippy"
                },
              }
            }
          }),
        }
        require("rust-tools").setup(rustopts)
        requested_server:attach_buffers()
      else
        requested_server:setup(lsp_opts)
      end
    end)

    if not requested_server:is_installed() then
      print("LSP Installing " .. lsp_name)
      requested_server:install()
    end
  end
end

