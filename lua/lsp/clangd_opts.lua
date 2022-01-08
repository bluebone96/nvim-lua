return {
  default_config = {
    cmd = {
      "clangd", "--background-index", "--pch-storage=memory",
      "--clang-tidy", "--suggest-missing-includes"
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    --root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true,
  },

  init_options = {
    fallbackFlags = {
      "-std=c++2a",
    },
  },
}
