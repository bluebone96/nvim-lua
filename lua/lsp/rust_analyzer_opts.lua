
return {
  settings = {
    ["rust-analyzer"] = {
      completion = {
        postfix = {
          enable = false
        }
      },
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
      checkOnSave = {
        command = "clippy"
      }
    },
  },

}
