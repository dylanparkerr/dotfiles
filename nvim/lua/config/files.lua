vim.pack.add({
    {src = 'https://github.com/stevearc/oil.nvim'}, -- modify files like any other buffer
})

local oil = require('oil')
oil.setup({
    view_options={
        show_hidden=true,
    },
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    float = {
        padding = 2,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = .7,
        max_height = .7,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
        get_win_title = nil,
        preview_split = "auto",
        override = function(conf)
            return conf
        end,
    },
})

require('core.utils').keymap('n','<leader>e', function() oil.toggle_float() end, 'open file [e]xplorer')
