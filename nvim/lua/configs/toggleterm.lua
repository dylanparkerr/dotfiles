require('toggleterm').setup{
    -- size can be a number or function which is passed the current terminal
    size = 20,
    -- open_mapping = '<leader>tt',
    hide_numbers = true, -- hide the number column in toggleterm buffers
    -- shade_filetypes = {},
    -- shade_terminals = true,
    -- shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = false, -- whether or not the open mapping applies in insert mode
    persist_size = false,
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = 'bash' -- change the default shell
}

-- custom floating term for lazygit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  count = 9,
  close_on_exit = true,
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

function Lazygit_toggle()
  lazygit:toggle()
end
