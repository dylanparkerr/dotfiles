vim.pack.add({
    {src = 'https://github.com/echasnovski/mini.nvim'},
})
require('mini.surround').setup()
-- see default config: https://github.com/echasnovski/mini.surround?tab=readme-ov-file#default-config
-- highlights are:
-- add = 'sa',       -- Add surrounding in Normal and Visual modes
-- delete = 'sd',    -- Delete surrounding
-- find = 'sf',      -- Find surrounding (to the right)
-- find_left = 'sF', -- Find surrounding (to the left)
-- highlight = 'sh', -- Highlight surrounding
-- replace = 'sr',   -- Replace surrounding
