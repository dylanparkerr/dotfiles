-- WARNING Log level DEBUG will cause degraded performance and high disk usage
-- vim.lsp.set_log_level("debug")

local keymap = function (mode, lhs, rhs, opts, desc)
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts, {desc = desc}))
end

-- ALL LSP BUFFERS
local on_attach = function (client, bufnr)
    -- These are essentially global and will try to be setup on any buffer attached to an lsp
    -- keymaps
    local opts = { noremap=true, silent=true, buffer=0 }
    keymap('n','gd','<cmd>Telescope lsp_definitions<cr>',opts) --lsp go to definition - shows telescope picker if there are multiple entries
    keymap('n','gr','<cmd>Telescope lsp_references<cr>',opts) --lsp go to symbol refrences - shows telescope picker if there are multiple entries
    keymap('n','gi','<cmd>Telescope lsp_implementations<cr>',opts) --lsp go to implementation - shows telescope picker if there are multiple entries
    keymap('n','gt','<cmd>Telescope lsp_type_definitions<cr>',opts) --lsp go to type definition - shows telescope picker if there are multiple entries
    keymap('n','gh','<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    keymap('n','gn','<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    keymap('n','ga','<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    keymap('n','gf','<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
end

-- server configs
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

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

require('lspconfig').jdtls.setup{
    on_attach = on_attach,
}

require('lspconfig').terraformls.setup{
    on_attach = on_attach,
}

