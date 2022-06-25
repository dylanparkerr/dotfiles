local packer = require('packer')

-- packer config
packer.init{
    display = {
        open_fn = require('packer.util').float
    }
}

-- call plugins
local use = packer.use
packer.reset()
packer.startup(function()

    -- so that packer can manage itself
    use 'wbthomason/packer.nvim' --packer plugin manager

    --aesthetics
    use 'kyazdani42/nvim-web-devicons' --fancy icons - requires a patched font
    use 'navarasu/onedark.nvim' --theme
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} --status bar at the bottom
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --text buffers as tabs
    use 'lukas-reineke/indent-blankline.nvim' --indent guidelines

    --functional
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} --file tree viewer
    use 'akinsho/toggleterm.nvim' --integrated terminal
    use 'terrortylor/nvim-comment' --easier comments

    --telescope
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'} --telescope fuzzy finder
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    --lsp
    use 'neovim/nvim-lspconfig' --automatically launch and initialize language servers
    use 'williamboman/nvim-lsp-installer' --lsp server installer
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} --better code parsing

    --auto complete and sources
    use 'hrsh7th/nvim-cmp'  -- completetion engine
    use 'hrsh7th/cmp-nvim-lsp'  -- completion source
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'onsails/lspkind-nvim' --autocomplete menu formatting

    --snipets
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'saadparwaiz1/cmp_luasnip' --luasnip and cmp integration
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets

    --git
    use {'lewis6991/gitsigns.nvim'}
end)
-- require('gitsigns').setup()
