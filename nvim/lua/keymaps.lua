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
-- keymap('i','kj','<Esc>',opts)

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
-- keymap('n','<leader>bd',':bd<CR>',opts)  -- close current split

-- telescope
keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',opts) --find files
keymap('n','<leader>fg','<cmd>Telescope git_files<cr>',opts) --find git files
keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',opts) --find vim help tage
keymap('n','<leader>fc','<cmd>Telescope current_buffer_fuzzy_find<cr>',opts) --fuzzy find in current buffer
keymap('n','<leader>fp','<cmd>Telescope live_grep<cr>',opts) --fuzzy find in current project
keymap('n','<leader>pp','<cmd>Telescope projects<cr>',opts) --switch git projects
keymap('n','gd','<cmd>Telescope lsp_definitions<cr>',opts) --lsp go to definition - shows telescope picker if there are multiple entries
keymap('n','gr','<cmd>Telescope lsp_references<cr>',opts) --lsp go to symbol refrences - shows telescope picker if there are multiple entries
keymap('n','gi','<cmd>Telescope lsp_implementations<cr>',opts) --lsp go to implementation - shows telescope picker if there are multiple entries
keymap('n','gt','<cmd>Telescope lsp_type_definitions<cr>',opts) --lsp go to type definition - shows telescope picker if there are multiple entries
keymap('n','gs','<cmd>Telescope lsp_document_symbols<cr>',opts) --lsp list symbols from current buffer

-- nvim tree
keymap('n','<leader>ee','<cmd>NvimTreeToggle<CR>',opts)

-- jump to next or previous highlight of symbol under cursor
-- this binding using ctrl might get problematic, keep an eye on it
keymap('n', '<C-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<C-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- git
keymap('n','<leader>dp','<cmd>Gitsigns preview_hunk<cr>',opts)  -- preview change hunk using gitsigns
keymap('n','<leader>dv','<cmd>lua DiffviewToggle()<cr>',opts) -- custom funtion to toggle Diffview
keymap("n", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts)  -- custom function to toggle lazygit
keymap("t", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts)  -- custom function to toggle lazygit

-- better buffer delete so that nvimtree doesn't resize
keymap("n", "<leader>bd", "<cmd>lua DeleteCurrentBuffer()<cr>", opts)
