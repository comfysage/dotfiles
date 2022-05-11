
call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rbgrouleff/bclose.vim' "ranger.vim needs it

Plug 'jiangmiao/auto-pairs' "auto brackets
Plug 'antonk52/vim-tabber' 

Plug 'vim-airline/vim-airline'
" Plug 'cocopon/pgmnt.vim'
Plug 'glepnir/dashboard-nvim'
Plug 'ap/vim-css-color'

" IDE
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NERDTree
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons' " NERDTree Icons
Plug 'kyazdani42/nvim-web-devicons' " Icons for Telescope

Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'airblade/vim-gitgutter'

" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-markdown'
" Plug 'godlygeek/tabular' " Before 'preservim/vim-markdown'
" Plug 'preservim/vim-markdown'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"Lua
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sharkdp/fd'
Plug 'numToStr/Comment.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim'

" Nvim cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind-nvim'

" LuaSnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"Colorschemes:
" Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/everforest'
" Plug 'sainnhe/edge'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'andreypopp/vim-colors-plain'
Plug 'crispybaccoon/fantastic.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'pwntester/nautilus.nvim'
Plug 'folke/tokyonight.nvim'

call plug#end()
