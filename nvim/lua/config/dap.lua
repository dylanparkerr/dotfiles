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
        name = "Spotlight (2GB)";
        type = "java";
        request = "launch";
        mainClass = 'cfa.spotlight.TestApplication';
        -- vmArgs = {"-Xmx2g","-Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan"}
        vmArgs = "".."-Xmx2g".." -Dspring-boot.run.profiles=global-defaults,test-environment,api,local,local-api,api-local,local-socailidm,dylan";
    },
}

dap.configurations.typescript = {
    {
        name = 'Typescript',
        type = 'pwa-node',
		request = 'launch',
		program = '${file}',
		cwd = '${workspaceFolder}',
    }
}

-- plugin to do it for go
require('dap-go').setup()
