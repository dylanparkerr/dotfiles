-- this is the default configuration provided by server_configurations.md

local sumneko_root_path
local sumneko_binary
local sumneko_main
local system_name

if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
    sumneko_root_path = '/home/dylan/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/'..system_name
    sumneko_binary = sumneko_root_path.."/lua-language-server"
    sumneko_main = sumneko_root_path.."/main.lua"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
    sumneko_root_path = 'C:\\Users\\Dylan\\AppData\\Local\\nvim-data\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\'..system_name
    sumneko_binary = sumneko_root_path..'\\lua-language-server.exe'
    sumneko_main = sumneko_root_path.."\\main.lua"
else
    print("Unsupported system for sumneko")
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    --cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    cmd = {sumneko_binary, "-E", sumneko_main};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
