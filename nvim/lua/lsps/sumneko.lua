-- this assumes language server is install with lspinstall
local cmd = ''
if vim.fn.has("unix") == 1 then
    cmd = "/home/dylan/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
elseif vim.fn.has('win32') == 1 then
    cmd = "C:\\Users\\Dylan\\AppData\\Local\\nvim-data\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\lua-language-server.exe"
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {cmd},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                -- Do not send telemetry data containing a randomized but unique identifier
                enable = false,
            },
        },
    },
}
