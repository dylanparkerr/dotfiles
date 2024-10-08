local set = vim.opt

--general
set.hidden=true                         -- Required to keep multiple buffers open
set.mouse='a'                           -- Enable your mouse
set.splitbelow=true                     -- Horizontal splits will automatically be below
set.splitright=true                     -- Vertical splits will automatically be to the right
set.conceallevel=0                      -- So that I can see `` in markdown files
set.background='dark'                   -- tell vim what the background color looks like
set.showtabline=2                       -- Always show tabs
set.backup=false                        -- Do not save backup
set.swapfile=false                      -- Do not make swap file
set.clipboard:append('unnamedplus')     -- Copy paste between vim and everything else
set.ruler=true                          -- Always display cursor
set.cmdheight=1                         -- More space for displaying messages
set.visualbell=true                     -- Use visual bell instead of beeping when doing something wrong
set.confirm=true                        -- Ask to save changes instead of failing command because of unsaved changes
set.laststatus=3                        -- Set on universal status line isntead of one for every open split
set.showcmd=true                        -- Show commands including <leader>

--search
set.hlsearch=true                       -- Enable search highlighting
set.ignorecase=true                     -- Ignore case when searching
set.incsearch=true                      -- Incremental search that shows partial matches
set.smartcase=true                      -- Automatically switch search to case-sensitive when search query contains an uppercase letter

-- tabs
set.expandtab=true                      -- Converts tabs to spaces
set.tabstop=4                           -- Insert 4 spaces for a tab
set.shiftwidth=4                        -- Change the number of space characters inserted for indentation
set.smarttab=true                       -- Pressing tab and bksp at the beggining of a line inserts/removes shiftwidth number of spaces
set.smartindent=true                    -- Will add an indent when creating a newline after a { for instance
set.autoindent=true                     -- New lines inherit the indent of prev line
set.shiftround=true                     -- When shifting lines, round the indentation to the nearest multiple of shiftwidth

--lines
set.number=true                         -- Line numbers
set.numberwidth=4                       -- columns used for the line number
set.scrolloff=10                        -- start scrolling when 10 lines from top or bottom
set.wrap=false                          -- Display long lines as just one line

-- when entering terminal windows, enter insert mode
vim.api.nvim_exec([[ autocmd BufWinEnter,WinEnter term://* startinsert ]], false)

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

