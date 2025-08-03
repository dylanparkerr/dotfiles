vim.pack.add({
    {src = 'https://github.com/mfussenegger/nvim-dap'},  -- the debug adapter protocol client implentation for neovim
    {src = 'https://github.com/nvim-neotest/nvim-nio'},  -- dependency for nvim-dap-ui
    {src = 'https://github.com/rcarriga/nvim-dap-ui'},   -- debugger ui
    {src = 'https://github.com/leoluz/nvim-dap-go'},     -- auto setup go dap config
})

local dap = require('dap')
local widgets = require("dap.ui.widgets")
local ui = require('dapui')
-- TODO: maybe change this set up, old config at the bottom
-- could be nice if i could mimic dap view.. and get a nice
-- toggle for big floating scopes window
ui.setup()

-- debugger
Keymap("n", "<leader>dc", function() dap.continue() end,  'Debug - continue')
Keymap("n", '<leader>dd', function() dap.disconnect() end,  'Debug detatch')
Keymap("n", '<leader>dt', function() dap.terminate(); ui.close(); end, 'Debug terminate')
Keymap("n", '<leader>di', function() widgets.hover() end, "Debug information")
Keymap("n", "<leader>dj", function() dap.step_over() end, 'Debug - step over')
Keymap("n", "<leader>dl", function() dap.step_into() end, 'Debug - step into')
Keymap("n", "<leader>dh", function() dap.step_out() end, 'Debug - step out')

-- breakpoints
Keymap('n', '<leader>bb', function() dap.toggle_breakpoint() end, 'Toggle breakpoint')
Keymap('n', '<leader>bc', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, 'Toggle condition breakpoint')
Keymap('n', '<leader>bl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, 'Toggle breakpoint log')
Keymap('n', '<leader>br', function() dap.clear_breakpoints() end, 'Clear breakpoints')

-- better icons
vim.fn.sign_define('DapBreakpoint',          { text='', texthl='error', linehl='', numhl='' })
vim.fn.sign_define('DapStopped',             { text='', texthl='error', linehl='ibl.indent.char.1', numhl= '' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected',  { text='', texthl='', linehl='', numhl= '' })
vim.fn.sign_define('DapLogPoint',            { text='', texthl='', linehl='', numhl= '' })

-- auto open and close use when starting/stopping debugger
dap.listeners.after.event_initialized["dapui_config"] = function()
    ui.open()
end
-- comment out to prevent ui from closing when unit tests finish
-- think this is why i used to have the these close functions in the keymap itself
dap.listeners.before.event_terminated["dapui_config"] = function()
    ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    ui.close()
end

-- go config
require('dap-go').setup()

-- ---------------------------------------------------------------------
-- -- configurations
-- -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
-- dap.configurations.java = {
--     {
--         name = "Spotlight";
--         type = "java";
--         request = "launch";
--         mainClass = 'cfa.spotlight.TestApplication';
--         -- vmArgs = {"-Xmx2g","-Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan"}
--         vmArgs = "".."-Xmx2g".." -Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan";
--     },
--     {
--         name = "Analytics",
--         type = "java",
--         request = "launch",
--         mainClass = "com.cfa.crn.TestApplication",
--         vmArgs = "" .. "-Xmx2g ",
--     },
--     {
--         name = "Analytics-Data",
--         type = "java",
--         request = "launch",
--         mainClass = "com.spotlight.analytics.data.services",
--         vmArgs = "" .. "-Xmx2g ",
--     },
--     {
--         name = "Campaigns",
--         type = "java",
--         request = "launch",
--         mainClass = "com.cfa.crn.spotlight.campaigns.TestApplication",
--         -- vmArgs = "" .. "-Xmx2g ",
--         -- vmArgs = "".."-Xmx2g".." -Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan";
--     },
--     {
--         name = "Cares",
--         type = "java",
--         request = "launch",
--         mainClass = "crn.idm.cares.TestApplication",
--         vmArgs = "" .. "-Xmx2g ",
--     },
-- }

-- i remeber i made some changes to this if i need to look back at it
-- local opts = {
--     -- theses are the defaults -- see :help dapui.setup() for more
--     controls = {
--         element = "repl",
--         enabled = true,
--         icons = {
--             disconnect = "",
--             pause = "",
--             play = "",
--             run_last = "",
--             step_back = "",
--             step_into = "",
--             step_out = "",
--             step_over = "",
--             terminate = ""
--         }
--     },
--     element_mappings = {},
--     expand_lines = true,
--     floating = {
--         border = "single",
--         mappings = {
--             close = { "q", "<Esc>" }
--         }
--     },
--     force_buffers = true,
--     icons = {
--         collapsed = "",
--         current_frame = "",
--         expanded = ""
--     },
--     layouts = { {
--         elements = {
--             {
--                 id = "scopes",
--                 size = 0.75
--             },
--             -- {
--             --     id = "breakpoints",
--             --     size = 0.25
--             -- },
--             -- {
--             --     id = "stacks",
--             --     size = 0.25
--             -- },
--             {
--                 id = "watches",
--                 size = 0.25
--             }
--         },
--         position = "left",
--         size = 40
--     }, {
--             elements = {
--                 {
--                     id = "repl",
--                     size = 0.5
--                 },
--                 {
--                     id = "console",
--                     size = 0.5
--                 }
--             },
--             position = "bottom",
--             size = 10
--         }
--     },
--     mappings = {
--         edit = "e",
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         repl = "r",
--         toggle = "t"
--     },
--     render = {
--         indent = 1,
--         max_value_lines = 100
--     }
-- }
