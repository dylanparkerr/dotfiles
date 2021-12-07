local packer = require('packer')

-- packer config
packer.init{
    display = {
        open_fn = require('packer.util').float,
        prompt_border = 'single' --this is not working
    }
}

-- call plugins
local use = packer.use
packer.reset()
packer.startup(function()

    --plugin manager
    use 'wbthomason/packer.nvim' --packer plugin manager

    --aesthetics
    use 'kyazdani42/nvim-web-devicons' --fancy icons
    use 'navarasu/onedark.nvim' --theme
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} --status bar at the bottom
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --text buffers as tabs

    --functional
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'} --telescope fuzzy finder
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} --file tree viewer
    use 'akinsho/toggleterm.nvim' --integrated terminal
    use 'terrortylor/nvim-comment' --easier comments

    --lsp
    use 'neovim/nvim-lspconfig' --automatically launch and initialize language servers
    use 'williamboman/nvim-lsp-installer' --lsp server installer
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} --better code parsing
    use 'onsails/lspkind-nvim' --autocomplete menu formatting

    --auto complete and sources
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    --snipets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip' --luasnip and cmp integration

end)

-- plugin configs
require('onedark').setup() --has to be called before lualine

require('lualine').setup{options = {theme = 'onedark'}}

require("bufferline").setup()

require('nvim_comment').setup({line_mapping = "<leader>cc", operator_mapping = "<leader>c"})

require('configs/nvim-tree')

require('configs/toggleterm')

require('configs/treesitter')

require('configs/cmp') --autocomplete config in its own file

require('lsps/sumneko') --lua lsp server config that i placed in its own file
