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

    use 'wbthomason/packer.nvim'
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'navarasu/onedark.nvim'
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

end)

-- plugin configs
require('onedark').setup{}

require('lualine').setup{
    options = {theme = 'onedark'}
}

--[[
require('lspconfig').sumneko_lua.setup{
    cmd = {};
}
]]
require("bufferline").setup{}
--require('nvim-tree').setup {}
