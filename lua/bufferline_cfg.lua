-- bufferline tab标签
require("bufferline").setup {
  options = {
    -- 序号 "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    numbers = "buffer_id",
    -- 文件名长度
    max_name_length = 15,
    tab_size = 15,
    -- 使用nvim内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {{ filetype = "NvimTree",
      text = "File Explorer",
      hightlight = "Directory",
      text_align = "left"
    }}
  }
}


