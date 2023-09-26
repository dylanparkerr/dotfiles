local packer = require('packer')

-- packer config
packer.init{
    display = {
        open_fn = require('packer.util').float
    }
}

local use = packer.use
packer.reset()
packer.startup(function()

    -- so that packer can manage itself
    use 'wbthomason/packer.nvim' --packer plugin manager

    --aesthetics
    use 'kyazdani42/nvim-web-devicons' --fancy icons - requires a patched font
    use 'navarasu/onedark.nvim' --theme
    use 'HiPhish/rainbow-delimiters.nvim' --alternating paren and bracket colors
    use 'nvim-lualine/lualine.nvim'  --status bar at the bottom
    use 'akinsho/bufferline.nvim'  --text buffers as tabs
    use 'lukas-reineke/indent-blankline.nvim'  --indent guidelines
    use 'j-hui/fidget.nvim'  --lsp loading indicator
    use 'goolord/alpha-nvim'  --startup screen

    --functional
    use 'lewis6991/impatient.nvim' --speeds up performance by caching compiled plugins
    -- use 'kyazdani42/nvim-tree.lua'--file tree viewer  ******* TODO probably remove this if the telescope file browser is good **********
    use 'akinsho/toggleterm.nvim' --integrated terminal
    use 'terrortylor/nvim-comment' --easier comments
    use 'windwp/nvim-autopairs' --auto pair ' " { ( [ etc
    use 'echasnovski/mini.nvim' --add/delete/replace ' " { ( [ etc around things
    -- use 'folke/which-key.nvim' --motion and command key reminders

    --telescope
    use 'nvim-lua/plenary.nvim' --used by a lot of stuff
    use 'nvim-telescope/telescope.nvim'
    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --faster searching
    use 'ahmedkhalf/project.nvim' --git project switcher
    use 'nvim-telescope/telescope-file-browser.nvim' --switched to this from nvim-tree

    --lsp
    use 'williamboman/mason.nvim' -- installer for lsp servers, dap servers, linters, and formaters
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' --automatically launch and initialize language servers
    use 'nvim-treesitter/nvim-treesitter' --better code parsing
    -- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} --TSUpdate needs to be ran in the x64 Native Tools Command Line on Windows
    use 'RRethy/vim-illuminate' --highlight symbol under cursor

    --auto complete and sources
    use 'hrsh7th/nvim-cmp' --completetion engine
    use 'hrsh7th/cmp-nvim-lsp' --completion source
    use 'hrsh7th/cmp-buffer' --completion source
    use 'hrsh7th/cmp-path' --completion source
    use 'onsails/lspkind-nvim' --autocomplete menu formatting

    --snipets
    use 'L3MON4D3/LuaSnip' --snippet engine
    use 'saadparwaiz1/cmp_luasnip' --luasnip as cmp completion source
    use 'rafamadriz/friendly-snippets' --a bunch of snippets

    --git
    use 'lewis6991/gitsigns.nvim' --visual git change indicators in gutters
    use 'sindrets/diffview.nvim' --tabgroup for viewing git changes

end)
