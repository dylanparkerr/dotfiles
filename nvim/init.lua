--                                 __                
--    ___     ___    ___   __  __ /\_\    ___ ___    
--   / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
--  /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
--  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
--   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/

require('core.settings')
require('core.keymaps')
require('config.style')
require('config.finder')
require('config.files')
require('config.git')
require('config.completion')
require('config.lsp')
require('config.dap')
require('config.misc')

-- LOOK INTO GHOSTTY CURSOR TRAILS
-- folke's noice replacement for the command line looks cool

-- thoughts for new organization
-- break up into domains and vim.pack.add them there instead of one place
--   this may make things more cumbersome - idk but may be worth a try
--   if so its nothing to just move them to one place
--   thought being that plugins come and go but the part of the workflow that they help with usually dont
--
-- core (i should really start from almost nothing, adding only what i need if there isnt and updated default)
--      neovim settings and keybinds
-- aesthetics
-- lsp
-- dap
-- git
-- completion (remeber to tell blink to not show completions when in picker)
-- picker
-- navigation (harpoon, go to next diagnostic)
-- files (oil)
--
--
-- have keybinds that relate to that area defined in that area
-- use a global keymap function that has a prefix to the the description so that i can 
-- some how use a picker to see just the keymaps that i have defined
--   lets also try to do a better job of standardizing keybinds based on domain (thinking about git, but lsp could use some love)
--
-- if i find some useful functionality - maybe i make my own wrapper for it
-- or take the implementation for it and define a global - thinking about snacks.git.get_root_dir
-- maybe export something like picker.Filetype for reference in completion
-- and picker.go_to_definition etc. for reference in lsp
