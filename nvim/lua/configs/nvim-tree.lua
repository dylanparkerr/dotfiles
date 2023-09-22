local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-e>', api.tree.open(), opts('Open/Close tree'))
end


require('nvim-tree').setup({
    renderer = {
        indent_markers = {
            enable = true
        },
        icons = {
            git_placement = 'after'
        }
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false
    },
    -- view = {
    --     mappings = {
    --         list = {
    --             { key = "<C-e>", action = "" }
    --         }
    --     }
    -- },
    on_attach = on_attach,
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
})

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
