local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

--leader key for my own commands
keymap('','<Space>','<Nop>',opts)
vim.g.mapleader = ' '

-- Use alt + hjkl to resize windows
keymap('n','<C-Up>',':resize -2<CR>',opts)
keymap('n','<C-Down>',':resize +2<CR>',opts)
keymap('n','<C-Right>',':vertical resize -2<CR>',opts)
keymap('n','<C-Left>',':vertical resize +2<CR>',opts)

-- Better window navigation
keymap('n','<C-h>','<C-w>h',opts)
keymap('n','<C-j>','<C-w>j',opts)
keymap('n','<C-k>','<C-w>k',opts)
keymap('n','<C-l>','<C-w>l',opts)

-- Alternate ways to exit
keymap('i','jk','<Esc>',opts)
keymap('i','kj','<Esc>',opts)

-- Ways to cycle between open buffers
keymap('n','<S-l>',':bnext<CR>',opts)
keymap('n','<S-h>',':bprevious<CR>',opts)

-- Alternate ways to save and exit
keymap('n','<C-s>',':w<CR>',opts)
keymap('n','<C-q>',':q!<CR>',opts)
keymap('n','<C-x>',':wq<CR>',opts)

-- Move visual lines with Alt+j and Alt+k
keymap('n', '<A-j>', ':move .+1<CR>==', opts)
keymap('n', '<A-k>', ':move .-2<CR>==', opts)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Better tabbing
keymap('v','<A-h>','<gv',opts)
keymap('v','<A-l>','>gv',opts)

-- Hold on to yanked word after pasting over highlighted word
keymap("v", "p", '"_dP', opts)

-- better splits
keymap('n','<leader>vs',':vs<CR>',opts)  -- vertical split
keymap('n','<leader>hs',':split<CR>',opts)  -- horizontal split
keymap('n','<leader>cs','<C-w>c',opts)  -- close current split
keymap('n','<leader>bd',':bd<CR>',opts)  -- close current split

-- telescope
keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',opts) --find files
keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',opts) --find in current buffer
keymap('n','<leader>fb','<cmd>Telescope buffers<cr>',opts) --find in open buffers
keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',opts) --find in open buffers

-- nvim tree
keymap('n','<leader>ee','<cmd>NvimTreeToggle<CR>',opts)

-- for lsp bindings, see /configs/lsps.lua
