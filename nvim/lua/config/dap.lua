-- events
local dap = require('dap')
dap.listeners.after.event_initialized["dapui_config"] = function()
    require('dapui').open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    -- Commented to prevent DAP UI from closing when unit tests finish
    -- require('dapui').close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    -- Commented to prevent DAP UI from closing when unit tests finish
    -- require('dapui').close()
end


---------------------------------------------------------------------
-- configurations
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
dap.configurations.java = {
    {
        name = "Spotlight";
        type = "java";
        request = "launch";
        mainClass = 'cfa.spotlight.TestApplication';
        -- vmArgs = {"-Xmx2g","-Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan"}
        vmArgs = "".."-Xmx2g".." -Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan";
    },
    {
        name = "Analytics",
        type = "java",
        request = "launch",
        mainClass = "com.cfa.crn.TestApplication",
        vmArgs = "" .. "-Xmx2g ",
    },
    {
        name = "Analytics-Data",
        type = "java",
        request = "launch",
        mainClass = "com.spotlight.analytics.data.services",
        vmArgs = "" .. "-Xmx2g ",
    },
    {
        name = "Campaigns",
        type = "java",
        request = "launch",
        mainClass = "com.cfa.crn.spotlight.campaigns.TestApplication",
        -- vmArgs = "" .. "-Xmx2g ",
        -- vmArgs = "".."-Xmx2g".." -Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan";
    },
    {
        name = "Cares",
        type = "java",
        request = "launch",
        mainClass = "crn.idm.cares.TestApplication",
        vmArgs = "" .. "-Xmx2g ",
    },
}

-- plugin to do it for go
-- require('dap-go').setup()
-- dont really need this if i can find a way to export my .env vars before running
require('dap-go').setup({
  dap_configurations = {
    {
        name = "DMS - Binary",
        type = "go",
        request = "launch",
        program = "${workspaceFolder}/digital-marketing-service/cmd/digital-marketing/main.go",
        --envFile = "${workspaceFolder}/.env",
        -- delve = {
        --     -- args = {"--wd ${workspaceFolder}/digital-marketing-service/"},
        --     cwd = "${workspaceFolder}/digital-marketing-service/",
        -- }
    }
  },
})
