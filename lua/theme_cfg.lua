-- 主题设置
-- vim.fn.{function}() lua调用vimscript函数
if vim.fn.has('termguicolors') == 1 then
  vim.o.termguicolors = true
  vim.opt.termguicolors = true
end

-- sonokai 主题设置
-- The style of this color scheme.
-- Available values: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
vim.g.sonokai_style = 'atlantis'
-- 斜体
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_disable_italic_comment = 1
-- 透明
vim.g.sonokai_transparent_background = 0
-- 错误提示信息，下划线和染色背景
vim.g.sonokai_diagnostic_line_highlight = 1
vim.g.sonokai_diagnostic_text_highlight = 1
-- 优先只加载部分，后续加载全部。优化性能
vim.g.sonokai_better_performance = 1
vim.cmd [[ colorscheme sonokai ]]
--vim.g.colorscheme = "sonokai"

