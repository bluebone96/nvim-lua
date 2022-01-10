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
--map('n', '<F2>', ':NvimTreeToggle<CR>', opt)
map('n', '<A-m>', ':NvimTreeFindFileToggle<CR>', opt)
--map('n', '<F2>', ':NvimTreeRefresh<CR>', opt)
-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

-- bufferline
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map('n', "<leader>l", ":BufferLineCycleNext<CR>", opt)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', "<leader>mh", ":BufferLineMovePrev<CR>", opt)
map('n', "<leader>ml", ":BufferLineMoveNext<CR>", opt)

--These commands will sort buffers by directory, language, or a custom criteria
--map('n', "<Tab>se", ":BufferLineSortByExtension<CR>", opt)
--map('n', "<Tab>sd", ":BufferLineSortByDirectory<CR>", opt)


-- nvim-treesitter 代码格式化
map("n", "<leader>==", "gg=G", opt) -- 有的不支持lsp格式化,用这个

-- one-small-step-for-vimkind 调试debug
map('n', "<leader>r", ":lua require'osv'.run_this()<CR>", opt)
map('n', "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opt)
map('n', "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
map('n', "<F5>", ":lua require'dap'.continue()<CR>", opt)
map('n', "<F6>", ":lua require'dap'.step_over()<CR>", opt)
map('n', "<F7>", ":lua require'dap'.step_into()<CR>", opt)
map('n', "<F8>", ":lua require'dap'.step_out()<CR>", opt)

--    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--    nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
--    nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

-- telescope 模糊查询
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", opt)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>", opt)
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<cr>", opt)
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<cr>", opt)
map('n', '<leader>/',  ":lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opt)
--map('n', '<leader>fs', ":lua require('telescope.builtin').file_browser()<cr>", opt)

-- 插件快捷键 外部引用
local _plugin_keys = { }

-- lsp common keymapping
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
_plugin_keys.lsp_keymap_common = function(_, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- goto xx
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  --  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  --  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

end

-- nvim-cmp 自动补全快捷键
_plugin_keys.cmp_keymap = function(cmp)
  return {
    -- 上一个/ 下一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    -- 向上/向下滚动n个
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- 确认（函数带参数）
    --['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  }
end

-- telescope 模糊查询快捷键
_plugin_keys.telescope_keymap = function(actions)
  return {
     -- map actions.which_key to <C-h> (default: <C-/>)
     -- actions.which_key shows the mappings for your picker,
     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
    -- i: insert mode  n: normal mode
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    }
end

return _plugin_keys;


