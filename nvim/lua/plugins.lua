-- https://github.com/folke/lazy.nvim

-- boostrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- note: adding opts={} is like calling the plugins setup function, useful for one line setups

    -- aesthetics
    {'kyazdani42/nvim-web-devicons'}, --fancy icons - requires a patched font
    {'navarasu/onedark.nvim'}, --theme
    {'ellisonleao/gruvbox.nvim'}, --theme
    {'HiPhish/rainbow-delimiters.nvim'}, --alternating paren and bracket colors
    {'nvim-lualine/lualine.nvim'},  --status bar at the bottom
    {'akinsho/bufferline.nvim'},  --text buffers as tabs
    {'lukas-reineke/indent-blankline.nvim', main='ibl', opts={}},  --indent guidelines
    {'j-hui/fidget.nvim'},  --lsp loading indicator
    {'goolord/alpha-nvim'},  --startup screen

    -- functional
    {'lewis6991/impatient.nvim'}, --speeds up performance by caching compiled plugins
    {'akinsho/toggleterm.nvim'}, --integrated terminal
    {'terrortylor/nvim-comment'}, --easier comments
    {'windwp/nvim-autopairs'}, --auto pair ' " { ( [ etc
    {'echasnovski/mini.nvim'}, --add/delete/replace ' " { ( [ etc around things
    {'folke/which-key.nvim'}, --motion and command key reminders

    -- telescope
    {'nvim-lua/plenary.nvim'}, --used by a lot of stuff
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build='make'}, --faster searching
    {'nvim-telescope/telescope-file-browser.nvim'}, --switched to this from nvim-tree

    -- lsp
    {'williamboman/mason.nvim'}, -- installer for lsp servers, dap servers, linters, and formaters
    {'williamboman/mason-lspconfig.nvim'}, --shim to close the gaps between mason and lspconfig
    {'neovim/nvim-lspconfig'}, --automatically launch and initialize language servers
    {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'}, --better code parsing
    {'RRethy/vim-illuminate'}, --highlight symbol under cursor

    -- auto complete and sources
    {'hrsh7th/nvim-cmp'}, --completetion engine
    {'hrsh7th/cmp-nvim-lsp'}, --completion source
    {'hrsh7th/cmp-buffer'}, --completion source
    {'hrsh7th/cmp-path'}, --completion source
    {'onsails/lspkind-nvim'}, --autocomplete menu formatting

    -- snipets
    {'L3MON4D3/LuaSnip'}, --snippet engine
    {'saadparwaiz1/cmp_luasnip'}, --luasnip as cmp completion source
    -- {'rafamadriz/friendly-snippets'}, --a bunch of snippets

    -- git
    {'lewis6991/gitsigns.nvim', opts={}}, --visual git change indicators in gutters
    {'sindrets/diffview.nvim'}, --tabgroup for viewing git changes
}

-- lazy settings
local opts = {
    ui = {
        border = 'rounded'
    }
}

require('lazy').setup(plugins, opts)
