-- 基础设置
require('basic')
-- 按键映射
require('key_mapping')
-- Packer插件管理
require('packer_plugins')
-- 主题设置
require('theme_cfg')
-- tab标签
require('bufferline_cfg')
-- 下方状态栏
require('lualine_cfg')
-- 侧方目录树
require('nvimtree_cfg')
-- 语法高亮
require('treesitter_cfg')
-- lsp
require('lsp/lsp_setup')
-- 自动补全
require('nvimcmp_cfg')
-- bebug lua配置
require('nvimdap_cfg')
-- telescope 模糊查询
require('telescope_cfg')
-- autopairs 智能括号匹配
require('autopairs_cfg')

