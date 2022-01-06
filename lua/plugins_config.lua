
-- monokai 主题设置
require('monokai').setup {}
--require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }


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

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup {}
