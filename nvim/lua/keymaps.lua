local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}
--keymap('','','',opts)

--leader key for my own commands
vim.g.mapleader = ' '

-- Use alt + hjkl to resize windows
keymap('n','<M-j>',':resize -2<CR>',opts)
keymap('n','<M-k>',':resize +2<CR>',opts)
keymap('n','<M-h>',':vertical resize +2<CR>',opts)
keymap('n','<M-l>',':vertical resize -2<CR>',opts)

-- Better window navigation
keymap('n','<C-h>','<C-w>h',opts)
keymap('n','<C-j>','<C-w>j',opts)
keymap('n','<C-k>','<C-w>k',opts)
keymap('n','<C-l>','<C-w>l',opts)

-- Alternate ways to exit insert mode
keymap('i','jf','<Esc>',opts)
keymap('i','fj','<Esc>',opts)

-- Ways to cycle between open buffers
keymap('n','<TAB>',':bnext<CR>',opts)
keymap('n','<S-TAB>',':bprevious<CR>',opts)

-- Alternate ways to save and exit
keymap('n','<C-s>',':w<CR>',opts)
keymap('n','<C-q>',':q!<CR>',opts)
keymap('n','<C-x>',':wq<CR>',opts)

-- Better tabbing
keymap('v','<','<gv',opts)
keymap('v','>','>gv',opts)

--telescope
keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',opts)
