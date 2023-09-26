local keymap = function (mode, lhs, rhs, opts, desc)
    vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend("keep", opts, {desc = desc}))
end
local opts = {noremap = true, silent = true}

--leader key for my own commands
keymap('','<Space>','<Nop>',opts)
vim.g.mapleader = ' '

-- Use alt + hjkl to resize windows
keymap('n','<C-Up>',':resize +2<CR>',opts,'Increase window vertical size')
keymap('n','<C-Down>',':resize -2<CR>',opts, 'Decrease window vertical size')
keymap('n','<C-Right>',':vertical resize +2<CR>',opts, 'Increase window horizontal size')
keymap('n','<C-Left>',':vertical resize -2<CR>',opts, 'Decrease window horizontal size')

-- Better window navigation
keymap('n','<C-h>','<C-w>h',opts, 'Move to left window')
keymap('n','<C-j>','<C-w>j',opts,'Move to lower window')
keymap('n','<C-k>','<C-w>k',opts, 'Move to upper window')
keymap('n','<C-l>','<C-w>l',opts, 'Move to right window')
keymap('t','<C-h>','<C-\\><C-n><C-w>h',opts, 'Move to left window')
keymap('t','<C-j>','<C-\\><C-n><C-w>j',opts, 'Move to lower window')
keymap('t','<C-k>','<C-\\><C-n><C-w>k',opts, 'Move to upper window')
keymap('t','<C-l>','<C-\\><C-n><C-w>l',opts, 'Move to right window')

-- Alternate ways to exit
keymap('i','jk','<Esc>',opts)
-- keymap('i','kj','<Esc>',opts)

-- Ways to cycle between open buffers
keymap('n','<S-l>',':bnext<CR>',opts, 'Move to next buffer')
keymap('n','<S-h>',':bprevious<CR>',opts, 'Move to previous buffer')

-- Alternate ways to save and exit
keymap('n','<C-s>',':w<CR>',opts, 'Save')
keymap('n','<C-q>',':q!<CR>',opts, 'Quit')
keymap('n','<C-x>',':wq<CR>',opts, 'Save and quit')

-- Move visual lines with Alt+j and Alt+k
keymap('n', '<A-j>', ':move .+1<CR>==', opts, 'Move current line down')
keymap('n', '<A-k>', ':move .-2<CR>==', opts, 'Move current line up')
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts, 'Move current line down')
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts, 'Move current line up')
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv", opts, 'Move current line down')
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts, 'Move current line up')
-- Better tabbing
keymap('v','<A-h>','<gv',opts, 'Indent currently selected line(s)')
keymap('v','<A-l>','>gv',opts, 'Unindent currently selected line(s)')
--TODO same tabbing for single lines in normal and insert mode for consistency

-- Hold on to yanked word after pasting over highlighted word
keymap("v", "p", '"_dP', opts)

-- better splits
keymap('n','<leader>vs',':vs<CR>',opts, 'Vertical split')  -- vertical split
keymap('n','<leader>hs',':split<CR>',opts, 'Horizontal split')  -- horizontal split
keymap('n','<leader>cs','<C-w>c',opts, 'Close split')  -- close current split

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

--*************THESE KEYBINDS ONLY BIND WHEN AN LSP SERVER ATTACHES TO A BUFFER*****************
--found in configs/lspconfig.lua
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<leader>fm', vim.lsp.buf.formatting, bufopts)

-- jump to next or previous highlight of symbol under cursor
-- this binding using ctrl might get problematic, keep an eye on it
keymap('n', '<C-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts, 'Next ref of word under cursor')
keymap('n', '<C-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts, 'Previous ref of word under cursor')

-- git
keymap('n','<leader>dp','<cmd>Gitsigns preview_hunk<cr>',opts)  -- preview change hunk using gitsigns
keymap('n','<leader>dv','<cmd>lua DiffviewToggle()<cr>',opts) -- custom funtion to toggle Diffview
keymap("n", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts, 'Toggle Lazygit')  -- custom function to toggle lazygit
keymap("t", "<C-g>", "<cmd>lua Lazygit_toggle()<CR>", opts, 'Toggle Lazygit')  -- custom function to toggle lazygit

-- specifically toggle term 1 since lazygit spawns on term 9
keymap("n", "<C-_>", "<cmd>ToggleTerm 1<CR>", opts, 'Toggle terminal')  -- actually maps to ctrl + /
keymap("t", "<C-_>", "<cmd>ToggleTerm 1<CR>", opts, 'Toggle terminal') -- actually maps to ctrl + /

-- Center search results
keymap("n", "n", "nzz", opts, 'Next result in buffer search')
keymap("n", "N", "Nzz", opts, 'Previous result in buffer search')

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- better buffer delete so that nvimtree doesn't resize
function DeleteCurrentBuffer()
    local cbn = vim.api.nvim_get_current_buf()
    local buffers = vim.fn.getbufinfo({buflisted = true})
    local size = 0
    local idx = 0
    for n, e in ipairs(buffers) do
        size = size + 1
        if e.bufnr == cbn then
            idx = n
        end
    end
    if idx == 0 then return end
    if idx == size then
        vim.cmd("bprevious")
    else
        vim.cmd("bnext")
    end
    vim.cmd("bdelete " .. cbn)
end
keymap("n", "<leader>bd", "<cmd>lua DeleteCurrentBuffer()<cr>", opts)
