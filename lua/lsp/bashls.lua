return {
--  settting = {
--    -- Default Values:
--    cmd = { "bash-language-server", "start" },
--    cmd_env = {
--      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
--    },
--    filetypes = { "sh" },
--    root_dir = util.find_git_ancestor,
--    single_file_support = true,
--  },

  -- map buffer local keybindings when the language server attaches
  on_attach = require('key_mapping').lsp_keymap_common,

  flags = {
    debounce_text_changes = 150,
  },
}
