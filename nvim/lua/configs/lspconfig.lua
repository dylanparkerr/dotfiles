-- WARNING Log level DEBUG will cause degraded performance and high disk usage
-- vim.lsp.set_log_level("debug")

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
    require('illuminate').on_attach(client)
end

-- LUA
require('lspconfig').lua_ls.setup{
    on_attach = on_attach,
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
                checkThirdParty = false,
            },
            telemetry = {
                -- Do not send telemetry data containing a randomized but unique identifier
                enable = false,
            },
        },
    }
}

-- PYTHON
require('lspconfig').pyright.setup{
    on_attach = on_attach,
}

-- JAVASCRIPT
require('lspconfig').tsserver.setup{
    on_attach = on_attach,
}

-- Go
require('lspconfig').gopls.setup{
    on_attach = on_attach,
}
