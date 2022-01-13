local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path})
  end

  return require('packer').startup(function(use)
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- 主题插件
    use 'tanvirtin/monokai.nvim'
    use 'sainnhe/sonokai'
    -- 目录树插件
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons'}, -- optional, for file icon
    }
    -- Tab标签
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- 语法高亮支持
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', requires = {
        -- ts-rainbow 彩虹括号 依赖 nvim-treesitter
        {'p00f/nvim-ts-rainbow', opt = true },
        -- tab跳出括号
        {'abecodes/tabout.nvim'},
      },
    }
    -- 类型airline 状态栏
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- lsp 语法检测
    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/nvim-lsp-installer', -- lsp-server下载
      },
    }
    -- nvim-cmp 自动补全
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    -- snippets 引擎
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- debug lua
    use {
      'jbyuki/one-small-step-for-vimkind',
      requires = 'mfussenegger/nvim-dap',
    }
    -- telescope 模糊查找
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}, -- 加速搜索
        -- {'nvim-telescope/telescope-file-browser.nvim'}
      }
    }

    -- autopair 括号自动补全
    use 'windwp/nvim-autopairs'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end

  end)


