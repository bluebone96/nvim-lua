local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer") if not status_ok then return
end

-- Use a loop to conveniently call 'setup' on multiple servers
local lsp_servers = { "pyright", "rust_analyzer", "clangd", "cmake", "bashls", "sumneko_lua" }

lsp_installer.setup({
  automatic_installation = true,
  ensure_installed = lsp_servers,
})


local sok, lsp_config = pcall(require, "lspconfig")
if not sok then
  return
end


local rust_tools_status, rust_tools = pcall(require, "rust-tools")

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- pairs hash遍历，ipairs 必须以1开始遍历到不连续为止
for _, server in ipairs(lsp_servers) do
  local opts = {
    on_attach = require('key_mapping').lsp_keymap_common,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  if server == "rust_analyzer" and rust_tools_status then
    rust_tools.setup {
      server = opts
    }
  else
    lsp_config[server].setup(opts)
  end
end
