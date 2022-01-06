
-- monokai 主题设置
--require('monokai').setup {}
--require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }

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

