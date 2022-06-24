-- this assumes language server is install with lspinstall
-- these paths can be definitly be better be referencing user local data with some env var
local sumneko_bin = ''
local pyright_bin = ''
if vim.fn.has("unix") == 1 then
    sumneko_bin = "/home/dylan/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
    pyright_bin = "/home/dylan/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"
elseif vim.fn.has('win32') == 1 then
    -- local user = 'dylparke'  -- work
    local user = 'Dylan'        -- personal
    sumneko_bin = "C:\\Users\\"..user.."\\AppData\\Local\\nvim-data\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\lua-language-server.exe"
    pyright_bin = "C:\\Users\\"..user.."\\AppData\\Local\\nvim-data\\lsp_servers/python/node_modules/.bin/pyright-langserver.cmd"
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_bin},
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

require'lspconfig'.pyright.setup{
    cmd = {pyright_bin, "--stdio"};
    -- cmd = {pyright_bin, "--stdio"};
}
