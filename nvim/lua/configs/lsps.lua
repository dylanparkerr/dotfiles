vim.lsp.set_log_level("debug")
-- this assumes language server is install with lspinstall
-- these paths can be definitly be better be referencing user local data with some env var
-- looks into vim.fn.expand('~')
-- or vim.fn.stdpath("data")
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

local on_attach = function (client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=0 }
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- handled by telescope
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- dont really need
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)-- handled by telescope
    -- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)-- handled by telescope
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- handeled by telescope
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.formatting, bufopts)
    -- vim.keymap.set('n', '', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
end


require'lspconfig'.sumneko_lua.setup {
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

require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    cmd = {pyright_bin, "--stdio"};
    -- cmd = {pyright_bin, "--stdio"};
}
