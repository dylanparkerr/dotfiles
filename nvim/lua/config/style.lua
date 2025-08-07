vim.pack.add({
    {src = 'https://github.com/kyazdani42/nvim-web-devicons'},    -- requires a patched font
    {src = 'https://github.com/catppuccin/nvim'},                 -- theme
    {src = 'https://github.com/nvim-lualine/lualine.nvim'},       -- status bar at the bottom
    {src = 'https://github.com/akinsho/bufferline.nvim'},         -- text buffers as tabs
    {src = 'https://github.com/nvim-treesitter/nvim-treesitter'}, -- launguage parser manager
    {src = 'https://github.com/j-hui/fidget.nvim'},               -- lsp loading indicator
})
local keymap = require('core.utils').keymap

-- theme
-- :help highlight-groups
vim.cmd.colorscheme("catppuccin-macchiato")

-- visually highlight the text that gets copied when i yank 
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- always open help pages in a new tab 
-- so they are full screen
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd T")
    end
  end,
})

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

-- language syntax token parsers
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
    auto_install = true, -- when opening new filetype
    highlight = { enable = true, },
    indent = { enable = true, }
})

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

-- buffers as 'tab's
local bufferline = require("bufferline")
bufferline.setup()
keymap('n','<S-h>', function() bufferline.cycle(-1)end , 'Move to previous buffer')
keymap('n','<S-l>', function () bufferline.cycle(1) end, 'Move to next buffer')
keymap('n','<leader>hh', function() bufferline.move(-1)end, 'Move current buffer left')
keymap('n','<leader>ll', function() bufferline.move(1)end, 'Move current buffer right')


-- lsp loading indicator
require('fidget').setup({
    progress = {
        display = {
            progress_icon = {pattern = 'dots'}
        }
    }
})

