vim.pack.add({
    {src = 'https://github.com/kyazdani42/nvim-web-devicons'},    -- requires a patched font
    {src = 'https://github.com/catppuccin/nvim'},                 -- theme
    {src = 'https://github.com/nvim-lualine/lualine.nvim'},       -- status bar at the bottom
    {src = 'https://github.com/akinsho/bufferline.nvim'},         -- text buffers as tabs
    {src = 'https://github.com/nvim-treesitter/nvim-treesitter'}, -- parser manager
    {src = 'https://github.com/j-hui/fidget.nvim'},               -- lsp loading indicator
})
local keymap = require('core.utils').keymap

-- visually highlight the text that gets copied when i yank 
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- TODO: does this go here, or does it go in lsp ?
-- clearer diagnostic info
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})

-- theme
vim.cmd.colorscheme("catppuccin-macchiato")

-- bottom status bar
require('lualine').setup{
    options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        path = 1,
    }
}

-- buffers as tabs
local bufferline = require("bufferline")
bufferline.setup()
-- so that when using :BuffLineMovePrev and :BuffLineMoveNext to order buffers
-- the new internal order is accessable when using :bnext and :bprevious
vim.opt.sessionoptions:append('globals')
-- idk if its mac version of vim, or tmux, but keybind modifiers are limited..
keymap('n','<leader>hh', function() bufferline.move(-1)end, "")
keymap('n','<leader>ll', function() bufferline.move(1)end, "")


-- lsp loading indicator
require('fidget').setup({
    progress = {
        display = {
            progress_icon = {pattern = 'dots'}
        }
    }
})

-- language syntax token parsers
require('nvim-treesitter.configs').setup({
    auto_install = true, -- when opening new filetype
    highlight = { enable = true, },
    indent = { enable = true, }
})
