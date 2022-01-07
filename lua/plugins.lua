local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  -- Tab标签
  use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- 语法高亮支持
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate' 
  }
  -- 类型airline 状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)


