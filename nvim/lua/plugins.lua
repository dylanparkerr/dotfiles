packer = require('packer')

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

    use 'wbthomason/packer.nvim' --packer plugin manager
    use 'kyazdani42/nvim-web-devicons' --fancy icons
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}} --telescope fuzzy finder
    use 'navarasu/onedark.nvim' --theme
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} --status bar at the bottom
    use 'neovim/nvim-lspconfig' --automatically launch and initialize language servers
    use 'williamboman/nvim-lsp-installer' --lsp server installer
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} --text buffers as tabs
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} --file tree viewer
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} --better code parsing
    use {"akinsho/toggleterm.nvim"}

end)

-- plugin configs
require('onedark').setup() --has to be called before lualine

require('lualine').setup{
    options = {theme = 'onedark'}
}

require("bufferline").setup{}

require('nvim-tree').setup{
    --todo add config
}

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true or a list of languages will run `:h syntax` and tree-sitter at the same time.
        additional_vim_regex_highlighting = false,
    }
}

require('config-sumneko') --lua lsp server config that i placed in its own file



