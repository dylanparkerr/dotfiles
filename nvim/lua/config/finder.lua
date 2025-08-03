vim.pack.add({
    {src = 'https://github.com/folke/snacks.nvim'}, -- too many things in one honestly.. picker, dashboard, QoL stuff
})

-- really wish there was a way to set these up individually...
require('snacks').setup(
    {
        bigfile = { enabled = true },
        dashboard = {
            preset ={
                header = [[
                                 __                
    ___     ___    ___   __  __ /\_\    ___ ___    
   / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
]],
            },
            sections = {
                { section = "header" }
            }
        },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        picker = { enabled = true },
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

Keymap('n', '<leader>ff', function() Snacks.picker.files() end, "[f]ind [f]iles" )
Keymap('n', '<leader>fh', function() Snacks.picker.help() end, "[f]ind [h]elp" )
Keymap('n', '<leader>fp', function() Snacks.picker.grep() end, "[f]ind in [p]roject" )
Keymap('n', '<leader>fg', function() Snacks.picker.git_files() end, '[f]ind [g]it files')
Keymap('n', '<leader>fs', function() Snacks.picker.pickers() end, '[f]ind [s]nacks pickers')
Keymap('n', '<leader>fu', function() Snacks.picker.commands() end, '[f]ind [u]ser (:) commands')
Keymap('n', '<leader>fk', function() Snacks.picker.keymaps({layout={preset='select'}}) end, '[f]ind [k]eymaps')
-- Keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',default_opts, 'Find word in current buffer')
-- Keymap('n','<leader>fb','<cmd>Telescope dap list_breakpoints<cr>', default_opts, 'Find breakpoints')



-- export for use in lsp settings
local finder = {}
    function finder.lsp_references()
        Snacks.picker.lsp_references()
    end

    function finder.lsp_implementations()
        Snacks.picker.lsp_implementations()
    end
return finder
