return {
  -- default_config = {
  cmd = {
    "clangd --enable-config",
    "-Wall",
    "-Wextra",
    "-Werror",
    "--clang-tidy",
    "--background-index",
    "--pch-storage=memory",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
  },

  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },

  root_dir = Util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),

  single_file_support = true,
  -- },

  init_options = {
    fallbackFlags = {
      "-std=c++17",
    },
    clangdFileStatus = true
  },
}
