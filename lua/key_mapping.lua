-- vim.g.{name}:全局变量
-- vim.b.{name}: 缓冲区变量
-- vim.w.{name}: 窗口变量
-- vim.t.{name}: 选项卡变量
-- vim.v.{name}: 预定义变量
--
-- 前缀设置为空格 <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map映射 noremap 表示非递归
-- n 表示在普通模式下生效
-- v 表示在可视模式下生效
-- i 表示在插入模式下生效
-- c 表示在命令行模式下生效
-- silent 静默执行 忽略执行命令后的回显
-- silent! 静默执行 同时  忽略执行错误
-- 保存本地变量  map('模式','按键','映射为XX',opt)
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- <C-x> 表示 同时按 Control + x
-- 普通模式 向上/向下 移动9行 
map("n", "<C-u>", "9k", opt) 
map("n", "<C-d>", "9j", opt) 

-- 可视模式 连续 > 缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- <CR> 等于按下回车键
-- 普通模式 分屏
map("n", "sv", ":vsp<CR>", opt) -- 水平分屏
map("n", "sh", ":sp<CR>", opt) -- 垂直分屏
map("n", "sc", "<C-w>c", opt) -- 关闭当前分屏
map("n", "so", "<C-w>o", opt) -- close others

-- 普通模式 分屏比例控制（不常用，因为支持鼠标拖拽）
map("n", "s=", "<C-w>=", opt) -- 所有窗口比例恢复默认
map("n", "s.", ":vertical resize +20<CR>", opt) -- 水平比例
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "sj", ":resize +10<CR>",opt) -- 垂直比例
map("n", "sk", ":resize -10<CR>",opt)

-- 普通模式 分屏窗口跳转 <A-x> 表示 Alt + x
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)


-- 插件快捷键
-- nvimTree 打开目录窗口
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

-- bufferline
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', "bl", ":BufferLineCycleNext<CR>", opt)
map('n', "bh", ":BufferLineCyclePrev<CR>", opt)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', "b[", ":BufferLineMoveNext<CR>", opt)
map('n', "[b", ":BufferLineMovePrev<CR>", opt)

--These commands will sort buffers by directory, language, or a custom criteria
map('n', "be", ":BufferLineSortByExtension<CR>", opt)
map('n', "bd", ":BufferLineSortByDirectory<CR>", opt)




