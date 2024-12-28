local opts = {
    -- theses are the defaults -- see :help dapui.setup() for more
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = { {
        elements = {
            {
                id = "scopes",
                size = 0.75
            },
            -- {
            --     id = "breakpoints",
            --     size = 0.25
            -- },
            -- {
            --     id = "stacks",
            --     size = 0.25
            -- },
            {
                id = "watches",
                size = 0.25
            }
        },
        position = "left",
        size = 40
    }, {
            elements = {
                {
                    id = "repl",
                    size = 0.5
                },
                {
                    id = "console",
                    size = 0.5
                }
            },
            position = "bottom",
            size = 10
        } 
    },
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
}
require('dapui').setup(opts)

-- use telescope to find highlight groups
vim.fn.sign_define('DapBreakpoint', { text='', texthl='error', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='', linehl='', numhl= '' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='', linehl='', numhl= '' })
vim.fn.sign_define('DapStopped', { text='', texthl='error', linehl='ibl.indent.char.1', numhl= '' })
