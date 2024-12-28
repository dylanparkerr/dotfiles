-- https://github.com/folke/lazy.nvim
-- boostrap so that lazy will install itself on first run after install
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
    {'kyazdani42/nvim-web-devicons'},                               -- fancy icons - requires a patched font
    {'navarasu/onedark.nvim'},                                      -- theme
    {'ellisonleao/gruvbox.nvim'},                                   -- theme
    {'catppuccin/nvim'},                                            -- theme
    {'nvim-lualine/lualine.nvim'},                                  -- status bar at the bottom
    {'akinsho/bufferline.nvim'},                                    -- text buffers as tabs
    {'j-hui/fidget.nvim'},                                          -- lsp loading indicator
    {'goolord/alpha-nvim'},                                         -- startup screen
    -- {'lukas-reineke/indent-blankline.nvim', main='ibl', opts={}},-- indent guidelines

    -- functional
    {'akinsho/toggleterm.nvim'},                    -- integrated terminal *** probably dont need this now that i have tmux
    {'terrortylor/nvim-comment'},                   -- easier comments
    {'echasnovski/mini.nvim'},                      -- add/delete/replace ' " { ( [ etc around things
    {'stevearc/oil.nvim'},                          -- edit files as a buffer
    {'ThePrimeagen/harpoon',branch='harpoon2'},     -- mark and jump to files

    -- telescope
    {'nvim-lua/plenary.nvim'},                                  -- used by a lot of stuff
    {'nvim-telescope/telescope.nvim'},                          -- the goated fuzzy finder
    {'nvim-telescope/telescope-fzf-native.nvim', build='make'}, -- faster searching
    {'nvim-telescope/telescope-dap.nvim'},                      -- search break points

    -- lsp
    {'williamboman/mason.nvim', opts={ui = {border = 'rounded'}}},                      -- installer for lsp servers, dap servers, linters, and formaters
    {'williamboman/mason-lspconfig.nvim'},                                              -- shim to close the gaps between mason and lspconfig
    {'WhoIsSethDaniel/mason-tool-installer.nvim'},                                      -- automatically installs external programs like lsp servers
    {'neovim/nvim-lspconfig'},                                                          -- automatically launch and initialize language servers
    {'mfussenegger/nvim-jdtls', ft='java', dependencies = {"mfussenegger/nvim-dap"}},   -- makes setup of jdtls(eclipse java language server) not a pain
    {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'},                             -- abstraction layer for treesitter config
    {'folke/neodev.nvim', opts = {} },                                                  -- neovim lua api completion
    {'RRethy/vim-illuminate'},                                                          -- highlight symbol under cursor

    -- dap
    {'mfussenegger/nvim-dap'},                                          -- the debug adapter protocol client implentation for neovim
    {'rcarriga/nvim-dap-ui', dependencies = {"nvim-neotest/nvim-nio"}}, -- TODO:config
    {'theHamsta/nvim-dap-virtual-text'},                                -- TODO:config
    {'leoluz/nvim-dap-go'},                                             -- TODO:config

    -- auto complete and sources
    {'hrsh7th/nvim-cmp'},       -- completetion engine
    {'hrsh7th/cmp-nvim-lsp'},   -- completion source
    {'hrsh7th/cmp-buffer'},     -- completion source
    {'hrsh7th/cmp-path'},       -- completion source
    {'onsails/lspkind-nvim'},   -- autocomplete menu formatting

    -- snipets
    {'L3MON4D3/LuaSnip'},               -- snippet engine
    {'saadparwaiz1/cmp_luasnip'},       -- luasnip as cmp completion source
    {'rafamadriz/friendly-snippets'},   -- a bunch of snippets

    -- git
    {'lewis6991/gitsigns.nvim', opts={}},   -- visual git change indicators in gutters
    {'sindrets/diffview.nvim'},             -- tabgroup for viewing git changes
}

require('lazy').setup(
    plugins,
    {ui={border='rounded'}}
)
