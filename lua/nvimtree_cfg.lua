-- a list of groups can be found at `:help nvim_tree_highlight`
--vim.cmd[[highlight NvimTreeFolderIcon guibg=blue]]

-- o 打开关闭文件夹
-- a 创建文件
-- r 重命名
-- x 剪切
-- c 拷贝
-- p 粘贴
-- d 删除
-- nvimTree 目录树 设置
require'nvim-tree'.setup {
  -- 关闭文件自动关闭
  auto_close = true,
  -- 显示 git状态图标
  -- 'git': {
  --  \   'unstaged': "✗",
  --  \   'staged': "✓",
  --  \   'unmerged': "",
  --  \   'renamed': "➜",
  --  \   'untracked': "★"
  git = {
    enable = true
  }
}


