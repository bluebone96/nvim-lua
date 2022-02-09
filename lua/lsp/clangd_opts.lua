return {
  default_config = {
    cmd = {
      "clangd",
      "-Wall",
      "-Wextra",
      "-Werror",
      "--clang-tidy",
      "--background-index",
      "--pch-storage=memory",
      "--suggest-missing-includes",
      "--header-insertion=iwyu"
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true,
  },

  init_options = {
    -- fallbackFlags = {
    --   "-std=c++2a",
    -- },
    clangdFileStatus = true
  },
}
