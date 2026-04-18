vim.pack.add({
    {src = 'https://github.com/mfussenegger/nvim-dap'},  -- the debug adapter protocol client implentation for neovim
    {src = 'https://github.com/nvim-neotest/nvim-nio'},  -- dependency for nvim-dap-ui
    {src = 'https://github.com/rcarriga/nvim-dap-ui'},   -- debugger ui
    {src = 'https://github.com/leoluz/nvim-dap-go'},     -- auto setup go dap config
})
local keymap = require('core.utils').keymap
local dap = require('dap')
local widgets = require("dap.ui.widgets")
local ui = require('dapui')
-- TODO: toggle for big floating scopes window
ui.setup()

-- debugger
keymap("n", "<leader>dc", function() dap.continue() end,  'Debug - continue')
keymap("n", '<leader>dd', function() dap.disconnect(); ui.close(); end,  'Debug detatch')
-- keymap("n", '<leader>dt', function() dap.terminate(); ui.close(); end, 'Debug terminate')
keymap("n", '<leader>di', function() widgets.hover() end, "Debug information")
keymap("n", "<leader>dj", function() dap.step_over() end, 'Debug - step over')
keymap("n", "<leader>dl", function() dap.step_into() end, 'Debug - step into')
keymap("n", "<leader>dh", function() dap.step_out() end, 'Debug - step out')

-- breakpoints
keymap('n', '<leader>bb', function() dap.toggle_breakpoint() end, 'Toggle breakpoint')
keymap('n', '<leader>bc', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, 'Toggle condition breakpoint')
keymap('n', '<leader>bl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, 'Toggle breakpoint log')
keymap('n', '<leader>br', function() dap.clear_breakpoints() end, 'Clear breakpoints')

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
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     ui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     ui.close()
-- end

-- this makes some go configs for me
-- bc delve is a pain manually for some reason
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
