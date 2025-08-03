vim.pack.add({
    {src = 'https://github.com/echasnovski/mini.nvim'},
})
require('mini.surround').setup()
-- see default config: https://github.com/echasnovski/mini.surround?tab=readme-ov-file#default-config
-- highlights are:
    -- add = 'sa',       -- Add surrounding in Normal and Visual modes
    -- delete = 'sd',    -- Delete surrounding
    -- replace = 'sr',   -- Replace surrounding
