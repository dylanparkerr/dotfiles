vim.pack.add({
    {src = 'https://github.com/folke/snacks.nvim'}, -- too many things in one honestly.. picker, dashboard, QoL stuff
})
local keymap = require('core.utils').keymap

local snacks = require('snacks')
snacks.setup(
    {
        bigfile = { enabled = true },
        dashboard = {
            preset ={
                header = table.concat({[[
                                 __                
    ___     ___    ___   __  __ /\_\    ___ ___    
   / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
]],
'\n'..vim.version().major..'.'..vim.version().minor..'.'..vim.version().patch}),
            },
            sections = {
                { section = 'header' },
            }
        },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        picker = { enabled = true }, -- this overrides vim.ui.select() lists
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            }
        }
    }
)

keymap('n', '<leader>ff', function() snacks.picker.files() end, "[f]ind [f]iles" )
keymap('n', '<leader>fh', function() snacks.picker.help() end, "[f]ind [h]elp" )
keymap('n', '<leader>fp', function() snacks.picker.grep() end, "[f]ind gre[p]" )
keymap('n', '<leader>fg', function() snacks.picker.git_files() end, '[f]ind [g]it files')
keymap('n', '<leader>fs', function() snacks.picker.pickers() end, '[f]ind [s]nacks pickers')
keymap('n', '<leader>fu', function() snacks.picker.commands() end, '[f]ind [u]ser (:) commands')
keymap('n', '<leader>fk', function() snacks.picker.keymaps({layout={preset='select'}}) end, '[f]ind [k]eymaps')
-- keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',default_opts, 'Find word in current buffer')
-- keymap('n','<leader>fb','<cmd>Telescope dap list_breakpoints<cr>', default_opts, 'Find breakpoints')



-- export for use in lsp settings
local finder = {}
    function finder.lsp_definitions()
        snacks.picker.lsp_definitions()
    end

    function finder.lsp_references()
        snacks.picker.lsp_references()
    end

    function finder.lsp_implementations()
        snacks.picker.lsp_implementations()
    end
return finder
