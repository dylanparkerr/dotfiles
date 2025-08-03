vim.pack.add({
    {src = 'https://github.com/williamboman/mason.nvim'}, -- installer for lsp servers, dap servers, linters, and formaters
    {src = 'https://github.com/neovim/nvim-lspconfig'},   -- sane default configs for new servers
})
require('mason').setup()
local keymap = require('core.utils').keymap

-- only set these bindings if an lsp client is attached to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local finder = require('config.finder')
        keymap('n', 'gd', finder.lsp_definitions, '[g]o to [d]efinition')
        keymap('n', 'gr', finder.lsp_references, '[g]o to [r]eferences')
        keymap('n', 'gi', finder.lsp_implementations, '[g]o to [i]mplementations')
        keymap('n', 'gt', vim.lsp.buf.type_definition, '[g]o to [t]ype definition')
        keymap('n', 'gh', vim.lsp.buf.hover, '[g]et [h]over information')
        keymap('n', 'gs', vim.lsp.buf.signature_help, '[g]et [s]ignature')
        keymap('n', 'ga', vim.lsp.buf.code_action, '[g]et code [a]ctions')
        keymap('n', 'gf', vim.lsp.buf.format, '[g]o [f]ormat')
        keymap('n', 'ge', vim.lsp.buf.rename, '[g]o r[e]name')
        keymap('n', 'gn', function() vim.diagnostic.jump({count=1}) end, '[g]o [n]ext diagnostic')
        keymap('n', 'gp', function() vim.diagnostic.jump({count=-1}) end, '[g]o [p]revious diagnostic')

        -- highlight symbol under cursor
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            -- GATCHA: tbd if this pcall stops errors from showing in servers that dont support
            callback = function()
                pcall(vim.lsp.buf.document_highlight)
            end,
        })
        -- remove hl after cursor moves
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
        })

        -- GATCHA: i think there should really only be one client attached 
        -- to a buffer.. but i've seen alot of snippets of iterating over 
        -- clients.. so i guess just be on the look out..
        local format_servers = {'gopls'}
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
                local clients = vim.lsp.get_clients({ bufnr = event.buf })
                for _, client in ipairs(clients) do
                    if require('core.utils').contains(format_servers, client.name) then
                        vim.lsp.buf.format({ async = true })
                        break -- stop after finding the first client that supports formatting
                    end
                end
            end,
        })

    end,
})


-- ADDING NEW SERVERS
-- find and install one with :Mason
-- the lspconfig plugin has sane defaults and calls vim.lsp.config(<server>) behind the scenes
-- see those here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- or set custom options if needed
-- vim.lsp.enable(<server>) makes sure they launch

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library',
                    -- unpack(vim.api.nvim_get_runtime_file('', true)),
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('pyright')
