local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
    require'completion'.on_attach(client)
    require('key_mapping').lsp_keymap_common(client, bufnr)
end

return {
  on_attach=on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  },

  flags = {
    debounce_text_changes = 150,
  },
}
