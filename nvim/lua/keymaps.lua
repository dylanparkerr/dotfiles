local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
--keymap('','','',opts)

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
keymap('v','jk','<Esc>',opts)
keymap('v','kj','<Esc>',opts)

-- Faster scrolling
keymap('n','<S-j>','10j',opts)
keymap('n','<S-k>','10k',opts)

-- Jump to beginning and end of line
keymap('n','<S-w>','$',opts)
keymap('n','<S-b>','0',opts)

-- Ways to cycle between open buffers
keymap('n','<S-l>',':bnext<CR>',opts)
keymap('n','<S-h>',':bprevious<CR>',opts)

-- Alternate ways to save and exit
keymap('n','<C-s>',':w<CR>',opts)
keymap('n','<C-q>',':q!<CR>',opts)
keymap('n','<C-x>',':wq<CR>',opts)

-- Better tabbing
keymap('v','<','<gv',opts)
keymap('v','>','>gv',opts)

-- Move visual lines with Alt+j and Alt+k
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Hold on to yanked word after pasting over highlighted word
keymap("v", "p", '"_dP', opts)

-- better splits
keymap('n','<leader>vs',':vs<CR>',opts)  -- vertical split
keymap('n','<leader>hs',':split<CR>',opts)  -- horizontal split
keymap('n','<leader>cs','<C-w>c',opts)  -- close current split

-- telescope
keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',opts)
