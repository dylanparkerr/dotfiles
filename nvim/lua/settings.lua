local set = vim.opt

--general
set.hidden=true                         -- Required to keep multiple buffers open multiple buffers
set.mouse='a'                           -- Enable your mouse
set.splitbelow=true                     -- Horizontal splits will automatically be below
set.splitright=true                     -- Vertical splits will automatically be to the right
set.conceallevel=0                      -- So that I can see `` in markdown files
set.background='dark'                   -- tell vim what the background color looks like
set.showtabline=2                       -- Always sshow tabs
set.backup=false                        -- Do not save backup
set.swapfile=false                      -- Do not make swap file
set.clipboard:append('unnamedplus')     -- Copy paste between vim and everything else
set.ruler=true                          -- Always display cursor
set.cmdheight=1                         -- More space for displaying messages
set.visualbell=true                     -- Use visual bell instead of beeping when doing something wrong
set.confirm=true                        -- Ask to save changes instead of failing command because of unsaved changes
set.laststatus=2                        -- Always display the status bar
set.showcmd=true                        -- Show commands including <leader>

--search
set.hlsearch=true                       -- Enable search highlighting
set.ignorecase=true                     -- Ignore case when searching
set.incsearch=true                      -- Incremental search that shows partial matches
set.smartcase=true                      -- Automatically switch search to case-sensitive when search query contains an uppercase letter

-- tabs
set.tabstop=4                           -- Insert 4 spaces for a tab
set.shiftwidth=4                        -- Change the number of space characters inserted for indentation
set.smarttab=true                       -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab=true                      -- Converts tabs to spaces
set.smartindent=true                    -- Makes indenting smart
set.autoindent=true                     -- New lines inherit the indent of prev line
set.shiftround=true                     -- When shifting lines, round the indentation to the nearest multiple of shiftwidth

--lines
set.number=true                         -- Line numbers
set.numberwidth=4                       -- columns used for the line number
set.scrolloff=10                        -- start scrolling when 10 lines from top or bottom
set.wrap=false                          -- Display long lines as just one line

set.formatoptions:remove('c','o')       -- Better comment properties
vim.cmd('autocmd FileType * set formatoptions-=cro')
