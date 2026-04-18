vim.pack.add({
    'https://github.com/echasnovski/mini.nvim',
    -- 'nvim.undotree',
})
require('mini.surround').setup()
-- see default config: https://github.com/echasnovski/mini.surround?tab=readme-ov-file#default-config
-- highlights are:
    -- add = 'sa',       -- Add surrounding in Normal and Visual modes
    -- delete = 'sd',    -- Delete surrounding
    -- replace = 'sr',   -- Replace surrounding

-- TODO: folding
-- vim.pack.add({
--     {src = 'https://github.com/kevinhwang91/nvim-ufo'},
-- })

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)

vim.cmd("packadd nvim.difftool")
