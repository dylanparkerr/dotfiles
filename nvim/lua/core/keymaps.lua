local keymap = require('core.utils').keymap

-- leader
keymap('','<Space>','<Nop>')
vim.g.mapleader = ' '

-- esc
keymap('i','jk','<Esc>')

-- use ctrl + arrows to resize windows
keymap('n','<C-Up>',':resize +2<CR>','Increase window vertical size')
keymap('n','<C-Down>',':resize -2<CR>', 'Decrease window vertical size')
keymap('n','<C-Right>',':vertical resize +2<CR>', 'Increase window horizontal size')
keymap('n','<C-Left>',':vertical resize -2<CR>', 'Decrease window horizontal size')

-- better window navigation
keymap('n','<C-h>','<C-w>h', 'Move to left window')
keymap('n','<C-j>','<C-w>j','Move to lower window')
keymap('n','<C-k>','<C-w>k', 'Move to upper window')
keymap('n','<C-l>','<C-w>l', 'Move to right window')
keymap('t','<C-h>','<C-\\><C-n><C-w>h', 'Move to left window')
keymap('t','<C-j>','<C-\\><C-n><C-w>j', 'Move to lower window')
keymap('t','<C-k>','<C-\\><C-n><C-w>k', 'Move to upper window')
keymap('t','<C-l>','<C-\\><C-n><C-w>l', 'Move to right window')

-- cycle buffers
keymap('n','<S-l>',':bnext<CR>', 'Move to next buffer')
keymap('n','<S-h>',':bprevious<CR>', 'Move to previous buffer')

-- move lines
-- normal
keymap('n', '<A-j>', ':move .+1<CR>==', 'Move current text line down')
keymap('n', '<A-k>', ':move .-2<CR>==', 'Move current text line up')
keymap('n','<A-h>','<<', 'Indent currently selected line(s)')
keymap('n','<A-l>','>>', 'Unindent currently selected line(s)')
-- visual
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", 'Move current text line down')
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", 'Move current text line up')
keymap('v','<A-h>','<gv', 'Indent currently selected line(s)')
keymap('v','<A-l>','>gv', 'Unindent currently selected line(s)')
-- insert
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', 'Move current text line down')
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi',  'Move current text line up')
keymap('i', '<A-h>', '<Esc><<gi',  'Indent currently selected line(s)')
keymap('i', '<A-l>', '<Esc>>>gi',  'Unindent currently selected line(s)')

-- Hold on to yanked word after pasting over highlighted word
keymap('v', 'p', '"_dP' )

-- consistent split commands
keymap('n','<leader>sv',':vs<CR>', '[s]plit [v]ertical')
keymap('n','<leader>sh',':split<CR>', '[s]plit [h]orizontal')
keymap('n','<leader>sc','<C-w>c', '[s]plit [c]lose')

-- comments
local remap_opts = {remap = true, silent = true}
keymap('n','<leader>c','gc', 'Comment', remap_opts)
keymap('v','<leader>c','gc', 'Comment', remap_opts)
keymap('n','<leader>cc','gcc', 'Comment current line', remap_opts)

-- built in buffer search (/search-term)
keymap('n', 'n', 'nzz',  'Next result in buffer search')
keymap('n', 'N', 'Nzz',  'Previous result in buffer search')
keymap('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>' )
