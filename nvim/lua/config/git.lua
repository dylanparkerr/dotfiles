vim.pack.add({
    {src = 'https://github.com/lewis6991/gitsigns.nvim'}, -- git signs, blame, hunk actions
    {src = 'https://github.com/sindrets/diffview.nvim'},  -- tabgroup for viewing git changes
})

-- the goat git plugin - should explore this more
local git = require('gitsigns')
git.setup()
Keymap('n', '<leader>vn', function() git.nav_hunk('next') end, '[v]ersion control: [n]ext hunk' )
Keymap('n', '<leader>vp', function() git.nav_hunk('prev') end, '[v]ersion control: [p]rev hunk' )
Keymap('n', '<leader>vb', function() git.toggle_current_line_blame() end, '[v]ersion control [b]lame' )
-- MAYBE: staging individual hunks

-- TODO: review if i want this or not
require("diffview").setup()
function DiffviewToggle()
  local lib = require'diffview.lib'
  local view = lib.get_current_view()
  if view then
    -- Current tabpage is a Diffview; close it
    vim.cmd(":DiffviewClose")
  else
    -- No open Diffview exists: open a new one
    vim.cmd(":DiffviewOpen")
  end
end
