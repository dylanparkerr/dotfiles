vim.pack.add({
    {src = 'https://github.com/mfussenegger/nvim-dap'},                                          -- the debug adapter protocol client implentation for neovim
    -- {src = 'https://github.com/rcarriga/nvim-dap-ui', dependencies = {"nvim-neotest/nvim-nio"}}, -- debug ui
    -- {src = 'https://github.com/theHamsta/nvim-dap-virtual-text'},                                -- TODO: review if i want this
    {src = 'https://github.com/igorlfs/nvim-dap-view'},
    {src = 'https://github.com/leoluz/nvim-dap-go'},                                             -- auto setup go dap config
})

local dap = require('dap')
Keymap("n", "<leader>dc", function() dap.continue() end,  'Debug - continue')
Keymap("n", '<leader>dd', function() dap.disconnect() end,  'Debug detatch')



local dapview = require('dap-view')
dapview.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapview.open()
end
-- 
-- local dap = require('dap')
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     require('dapui').open()
-- end

-- commented to prevent DAP UI from closing when unit tests finish
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     require('dapui').close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     require('dapui').close()
-- end
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
-- require('dapui').setup(opts)
--
-- vim.fn.sign_define('DapBreakpoint', { text='', texthl='error', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='', linehl='', numhl= '' })
-- vim.fn.sign_define('DapLogPoint', { text='', texthl='', linehl='', numhl= '' })
-- vim.fn.sign_define('DapStopped', { text='', texthl='error', linehl='ibl.indent.char.1', numhl= '' })

