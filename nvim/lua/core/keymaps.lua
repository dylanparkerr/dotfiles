local default_opts = {noremap = true, silent = true}
Keymap = function (mode, keymap, command, desc, opts)
    if opts == nil then
        opts = default_opts
    end
    if desc ~= nil then
        desc = 'custom: '..desc
    end
    vim.keymap.set(mode, keymap, command, vim.tbl_extend('keep', opts, {desc = desc}))
end

-- leader
Keymap('','<Space>','<Nop>')
vim.g.mapleader = ' '

-- esc
Keymap('i','jk','<Esc>')

-- use ctrl + arrows to resize windows
Keymap('n','<C-Up>',':resize +2<CR>','Increase window vertical size')
Keymap('n','<C-Down>',':resize -2<CR>', 'Decrease window vertical size')
Keymap('n','<C-Right>',':vertical resize +2<CR>', 'Increase window horizontal size')
Keymap('n','<C-Left>',':vertical resize -2<CR>', 'Decrease window horizontal size')

-- better window navigation
Keymap('n','<C-h>','<C-w>h', 'Move to left window')
Keymap('n','<C-j>','<C-w>j','Move to lower window')
Keymap('n','<C-k>','<C-w>k', 'Move to upper window')
Keymap('n','<C-l>','<C-w>l', 'Move to right window')
Keymap('t','<C-h>','<C-\\><C-n><C-w>h', 'Move to left window')
Keymap('t','<C-j>','<C-\\><C-n><C-w>j', 'Move to lower window')
Keymap('t','<C-k>','<C-\\><C-n><C-w>k', 'Move to upper window')
Keymap('t','<C-l>','<C-\\><C-n><C-w>l', 'Move to right window')

-- cycle buffers
Keymap('n','<S-l>',':bnext<CR>', 'Move to next buffer')
Keymap('n','<S-h>',':bprevious<CR>', 'Move to previous buffer')

-- move lines
-- normal
Keymap('n', '<A-j>', ':move .+1<CR>==', 'Move current text line down')
Keymap('n', '<A-k>', ':move .-2<CR>==', 'Move current text line up')
Keymap('n','<A-h>','<<', 'Indent currently selected line(s)')
Keymap('n','<A-l>','>>', 'Unindent currently selected line(s)')
-- visual
Keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", 'Move current text line down')
Keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", 'Move current text line up')
Keymap('v','<A-h>','<gv', 'Indent currently selected line(s)')
Keymap('v','<A-l>','>gv', 'Unindent currently selected line(s)')
-- insert
Keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', 'Move current text line down')
Keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi',  'Move current text line up')
Keymap('i', '<A-h>', '<Esc><<gi',  'Indent currently selected line(s)')
Keymap('i', '<A-l>', '<Esc>>>gi',  'Unindent currently selected line(s)')

-- Hold on to yanked word after pasting over highlighted word
Keymap("v", "p", '"_dP' )

-- consistent split commands
Keymap('n','<leader>sv',':vs<CR>', 'Vertical split')
Keymap('n','<leader>sh',':split<CR>', 'Horizontal split')
Keymap('n','<leader>sc','<C-w>c', 'Close split')

-- comments
local remap_opts = {remap = true, silent = true}
Keymap('n','<leader>c','gc', 'Comment', remap_opts)
Keymap('v','<leader>c','gc', 'Comment', remap_opts)
Keymap('n','<leader>cc','gcc', 'Comment current line', remap_opts)

-- -- telescope
-- Keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',default_opts, 'Find local file')
-- Keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',default_opts, 'Find help tag')
-- Keymap('n','<leader>fp','<cmd>Telescope live_grep<cr>',default_opts, 'Find word in current project')
-- Keymap('n','<leader>fg','<cmd>Telescope git_files<cr>',default_opts, 'Find git file')
-- Keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',default_opts, 'Find word in current buffer')
-- Keymap('n','<leader>ft','<cmd>Telescope builtin<cr>',default_opts, 'Find telescope picker')
-- Keymap('n','<leader>fu','<cmd>Telescope commands<cr>',default_opts, 'Find available user(:) command')
-- Keymap('n','<leader>fk','<cmd>Telescope keymaps<cr>',default_opts, 'Find keymaps')
-- Keymap('n','<leader>fb','<cmd>Telescope dap list_breakpoints<cr>', default_opts, 'Find breakpoints')
--
-- -- git
-- Keymap('n','<leader>dp','<cmd>Gitsigns preview_hunk<cr>',default_opts, 'Diff hunk preview')
-- Keymap('n','<leader>dv','<cmd>lua DiffviewToggle()<cr>',default_opts, 'Diff full preview')
-- Keymap('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame(); end, default_opts, 'Toggle git blame')

-- built in buffer search (/search-term)
Keymap("n", "n", "nzz",  'Next result in buffer search')
Keymap("n", "N", "Nzz",  'Previous result in buffer search')
Keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>" )

-- -- breakpoints
-- Keymap('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", default_opts, 'Toggle breakpoint')
-- Keymap('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", default_opts, 'Toggle condition breakpoint')
-- Keymap('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", default_opts, 'Toggle breakpoint log')
-- Keymap('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", default_opts, 'Clear breakpoints')
-- -- debugger
-- Keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", default_opts, 'Debug - continue')
-- Keymap("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end, default_opts, 'Debug detatch')
-- Keymap("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end, default_opts, 'Debug terminate')
-- Keymap("n", '<leader>di', function() require "dap.ui.widgets".hover() end, default_opts, "Debug information")
-- Keymap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", default_opts, 'Debug - step over')
-- Keymap("n", "<leader>dl", "<cmd>lua require'dap'.step_into()<cr>", default_opts, 'Debug - step into')
-- Keymap("n", "<leader>dh", "<cmd>lua require'dap'.step_out()<cr>", default_opts, 'Debug - step out')
