vim.pack.add({
    {src = 'https://github.com/kyazdani42/nvim-web-devicons'},                   -- requires a patched font
    {src = 'https://github.com/catppuccin/nvim'},                                -- theme
    {src = 'https://github.com/nvim-lualine/lualine.nvim'},                      -- status bar at the bottom
    {src = 'https://github.com/akinsho/bufferline.nvim'},                        -- text buffers as tabs
    {src = 'https://github.com/j-hui/fidget.nvim'},                              -- lsp loading indicator
    {src = 'https://github.com/nvim-treesitter/nvim-treesitter',version='main'}, -- launguage parser manager
})
local keymap = require('core.utils').keymap

-- theme
-- :help highlight-groups
vim.cmd.colorscheme("catppuccin-macchiato")

-- visually highlight the text that gets copied when i yank 
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- always open help pages in a new tab 
-- so they are full screen
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd T")
    end
  end,
})

-- clearer diagnostic info
vim.diagnostic.config({
    virtual_text = true,
    -- virtual_lines = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})

-- new after treesitter is baked into neovim
 vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then
        return
      end

      -- check if parser exists and load it
      if not vim.treesitter.language.add(language) then
        return
      end

      -- enables syntax highlighting and other treesitter features
      vim.treesitter.start(buf, language)

      -- enables treesitter based indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- bottom status bar
require('lualine').setup{
    options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        path = 1,
    }
}

-- buffers as 'tab's
local bufferline = require("bufferline")
bufferline.setup()
keymap('n','<S-h>', function() bufferline.cycle(-1)end , 'Move to previous buffer')
keymap('n','<S-l>', function () bufferline.cycle(1) end, 'Move to next buffer')
keymap('n','<leader>hh', function() bufferline.move(-1)end, 'Move current buffer left')
keymap('n','<leader>ll', function() bufferline.move(1)end, 'Move current buffer right')


-- lsp loading indicator
require('fidget').setup({
    progress = {
        display = {
            progress_icon = {pattern = 'dots'}
        }
    }
})

require("vim._core.ui2").enable {
  enable = true,
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = "cmd",
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 5, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 0.5, -- Maximum height.
    },
  },
}
