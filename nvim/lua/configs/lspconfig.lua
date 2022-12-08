vim.lsp.set_log_level("debug")
local nvim_data = vim.fn.stdpath('data')

-- this assumes language server is install with lspinstall
local sumneko_bin = ''
local pyright_bin = ''
if vim.fn.has("unix") == 1 then
    sumneko_bin = nvim_data.."/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
    pyright_bin = nvim_data.."/lsp_servers/python/node_modules/.bin/pyright-langserver"
elseif vim.fn.has('win32') == 1 then
    sumneko_bin = nvim_data.."\\lsp_servers\\sumneko_lua\\extension\\server\\bin\\lua-language-server.exe"
    pyright_bin = nvim_data.."\\lsp_servers/python/node_modules/.bin/pyright-langserver.cmd"
end

-- ALL LSP BUFFERS
local on_attach = function (client, bufnr)
    -- These are essentially global and will try to be setup on any buffer attached to an lsp
    -- keymaps
    local bufopts = { noremap=true, silent=true, buffer=0 }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.formatting, bufopts)

    -- highlight symbol under cursor
    vim.g.Illuminate_ftblacklist={'NvimTree'}
    require('illuminate').on_attach(client)
end


-- LUA
require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
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

-- PYTHON
require('lspconfig').pyright.setup{
    on_attach = on_attach,
    -- cmd = {pyright_bin, "--stdio"};
}
