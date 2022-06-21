require'lspconfig'.sumneko_lua.setup {
    -- TODO make the path to the binary dynamic
    -- this assumes language server is install with lspinstall
    -- cmd = {'/home/dylan/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server'},
    cmd = {'C:\\Users\\Dylan\\AppData\\Local\\nvim-data\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\lua-language-server.exe'},
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
