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
        name = "Debug Launch (2GB)";
        type = "java";
        request = "launch";
        vmArgs = "".."-Xmx2g"
    },
    -- {
    --     name = "Debug Attach (8000)";
    --     type = "java";
    --     request = "attach";
    --     hostName = "127.0.0.1";
    --     port = 8000;
    -- },
    {
        name = "Debug Attach (5005)";
        type = "java";
        request = "attach";
        hostName = "127.0.0.1";
        port = 5005;
    },
}
