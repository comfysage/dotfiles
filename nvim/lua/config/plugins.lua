-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- source on write
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- custom Plug commands
vim.cmd [[ command! -nargs=0 PlugClean PackerClean ]]
vim.cmd [[ command! -nargs=0 PlugInstall PackerInstall ]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'francoiscabrol/ranger.vim',
    requires = { 'rbgrouleff/bclose.vim' } }

  use { 'junegunn/fzf', run = 'call fzf#install()' }
  use 'junegunn/fzf.vim'

  use 'jiangmiao/auto-pairs'
  use 'antonk52/vim-tabber'
  use 'psliwka/vim-smoothie'
  use 'junegunn/vim-easy-align'
  use 'junegunn/vim-peekaboo'
  use 'nullchilly/fsread.nvim'

  use 'vim-airline/vim-airline'

  use 'ap/vim-css-color'

  -- IDE
  use 'mattn/emmet-vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  use 'kyazdani42/nvim-web-devicons' -- Icons for Telescope

  use 'pangloss/vim-javascript'
  use { 'prettier/vim-prettier', run = 'npm install --frozen-lockfile --production' }
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'sheerun/vim-polyglot'

  use 'elkowar/yuck.vim'

  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-markdown'

  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Lua
  use 'nvim-lua/plenary.nvim' -- utils
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'sharkdp/fd'
  use 'numToStr/Comment.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'

  -- Nvim cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline' }
  use 'uga-rosa/cmp-dictionary'
  use 'onsails/lspkind-nvim'

  -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Colorschemes

  use 'crispybaccoon/gruvbox'
  use 'sainnhe/everforest'
  use 'arcticicestudio/nord-vim'

  use 'sainnhe/gruvbox-material'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'joshdick/onedark.vim'
  use 'cocopon/iceberg.vim'

  use 'crispybaccoon/fantastic.vim'
  use 'crispybaccoon/dawn.vim'

end)