-- shorthand
-- consider making this global
local keymap = function (mode, lhs, rhs, opts, desc)
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts, {desc = desc}))
end
local opts = {noremap = true, silent = true}
local remap_opts = {remap = true, silent = true}

-- leader
keymap('','<Space>','<Nop>',opts)
vim.g.mapleader = ' '
-- esc
keymap('i','jk','<Esc>',opts)

-- use alt + arrows to resize windows
keymap('n','<C-Up>',':resize +2<CR>',opts,'Increase window vertical size')
keymap('n','<C-Down>',':resize -2<CR>',opts, 'Decrease window vertical size')
keymap('n','<C-Right>',':vertical resize +2<CR>',opts, 'Increase window horizontal size')
keymap('n','<C-Left>',':vertical resize -2<CR>',opts, 'Decrease window horizontal size')

-- better window navigation
keymap('n','<C-h>','<C-w>h',opts, 'Move to left window')
keymap('n','<C-j>','<C-w>j',opts,'Move to lower window')
keymap('n','<C-k>','<C-w>k',opts, 'Move to upper window')
keymap('n','<C-l>','<C-w>l',opts, 'Move to right window')
keymap('t','<C-h>','<C-\\><C-n><C-w>h',opts, 'Move to left window')
keymap('t','<C-j>','<C-\\><C-n><C-w>j',opts, 'Move to lower window')
keymap('t','<C-k>','<C-\\><C-n><C-w>k',opts, 'Move to upper window')
keymap('t','<C-l>','<C-\\><C-n><C-w>l',opts, 'Move to right window')

-- cycle buffers
keymap('n','<S-l>',':bnext<CR>',opts, 'Move to next buffer')
keymap('n','<S-h>',':bprevious<CR>',opts, 'Move to previous buffer')

-- move lines
-- normal
keymap('n', '<A-j>', ':move .+1<CR>==', opts, 'Move current text line down')
keymap('n', '<A-k>', ':move .-2<CR>==', opts, 'Move current text line up')
keymap('n','<A-h>','<<',opts, 'Indent currently selected line(s)')
keymap('n','<A-l>','>>',opts, 'Unindent currently selected line(s)')
-- visual
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts, 'Move current text line down')
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts, 'Move current text line up')
keymap('v','<A-h>','<gv',opts, 'Indent currently selected line(s)')
keymap('v','<A-l>','>gv',opts, 'Unindent currently selected line(s)')
-- insert
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts, 'Move current text line down')
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts, 'Move current text line up')
keymap('i', '<A-h>', '<Esc><<gi', opts, 'Indent currently selected line(s)')
keymap('i', '<A-l>', '<Esc>>>gi', opts, 'Unindent currently selected line(s)')

-- Hold on to yanked word after pasting over highlighted word
keymap("v", "p", '"_dP', opts)

-- consistent split commands
keymap('n','<leader>sv',':vs<CR>',opts, 'Vertical split')
keymap('n','<leader>sh',':split<CR>',opts, 'Horizontal split')
keymap('n','<leader>sc','<C-w>c',opts, 'Close split')

-- comments
keymap('n','<leader>c','gc', remap_opts, 'Comment')
keymap('v','<leader>c','gc', remap_opts, 'Comment')
keymap('n','<leader>cc','gcc', remap_opts, 'Comment current line')

-- telescope
keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',opts, 'Find local file')
keymap('n','<leader>fg','<cmd>Telescope git_files<cr>',opts, 'Find git file')
keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',opts, 'Find help tag')
keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',opts, 'Find word in current buffer')
keymap('n','<leader>fp','<cmd>Telescope live_grep<cr>',opts, 'Find word in current project')
keymap('n','<leader>fw','<cmd>Telescope grep_string<cr>',opts, 'Find word under cursor')
-- keymap('n','<leader>fb','<cmd>Telescope file_browser<cr>',opts, 'File browser')
keymap('n','<leader>ft','<cmd>Telescope builtin<cr>',opts, 'Find telescope picker')
keymap('n','<leader>fu','<cmd>Telescope commands<cr>',opts, 'Find available user(:) command')
keymap('n','<leader>fk','<cmd>Telescope keymaps<cr>',opts, 'Find keymaps')
keymap('n','<leader>fb','<cmd>Telescope dap list_breakpoints<cr>', opts, 'Find breakpoints')

-- git
keymap('n','<leader>dp','<cmd>Gitsigns preview_hunk<cr>',opts, 'Diff hunk preview')
keymap('n','<leader>dv','<cmd>lua DiffviewToggle()<cr>',opts, 'Diff full preview')
keymap("n", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts, 'Toggle Lazygit')
keymap("t", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts, 'Toggle Lazygit')
keymap('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame(); end, opts, 'Toggle git blame')

-- TODO: git rid of these now that i use tmux
-- specifically toggle term 1 since lazygit spawns on term 9
keymap("n", "<C-_>", "<cmd>ToggleTerm 1<CR>", opts, 'Toggle terminal')  -- actually maps to ctrl + /
keymap("t", "<C-_>", "<cmd>ToggleTerm 1<CR>", opts, 'Toggle terminal')

-- built in buffer search (/search-term)
keymap("n", "n", "nzz", opts, 'Next result in buffer search')
keymap("n", "N", "Nzz", opts, 'Previous result in buffer search')
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- breakpoints
keymap('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts, 'Toggle breakpoint')
keymap('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts, 'Toggle condition breakpoint')
keymap('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts, 'Toggle breakpoint log')
keymap('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts, 'Clear breakpoints')
-- debugger
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts, 'Debug - continue')
keymap("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end, opts, 'Debug detatch')
keymap("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end, opts, 'Debug terminate')
keymap("n", '<leader>di', function() require "dap.ui.widgets".hover() end, opts, "Debug information")
keymap("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", opts, 'Debug - step over')
keymap("n", "<leader>dl", "<cmd>lua require'dap'.step_into()<cr>", opts, 'Debug - step into')
keymap("n", "<leader>dh", "<cmd>lua require'dap'.step_out()<cr>", opts, 'Debug - step out')
