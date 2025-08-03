vim.pack.add({
    {src = 'https://github.com/williamboman/mason.nvim'}, -- installer for lsp servers, dap servers, linters, and formaters
    {src = 'https://github.com/neovim/nvim-lspconfig'},   -- sane default configs for new servers
})
require('mason').setup()


-- only set these bindings if an lsp client is attached to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local picker = require('config.finder')
        Keymap('n', 'gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
        Keymap('n', 'gr', picker.lsp_references, '[g]o to [r]eferences')
        Keymap('n', 'gi', picker.lsp_implementations, '[g]o to [i]mplementations')
        Keymap('n', 'gt', vim.lsp.buf.type_definition, '[g]o to [t]ype definition')
        Keymap('n', 'gh', vim.lsp.buf.hover, '[g]et [h]over information')
        Keymap('n', 'gs', vim.lsp.buf.signature_help, '[g]et [s]ignature')
        Keymap('n', 'ga', vim.lsp.buf.code_action, '[g]et code [a]ctions')
        Keymap('n', 'gf', vim.lsp.buf.format, '[g]o [f]ormat')
        Keymap('n', 'gR', vim.lsp.buf.rename, '[g]o [R]ename')
        -- Keymap('n', 'gn', vim.lsp.diagnostic.goto_next, '[g]o [n]ext diagnostic')
        -- Keymap('n', 'gp', vim.lsp.diagnostic.goto_prev, '[g]o [p]revious diagnostic')

        -- highlight symbol under cursor
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            -- callback = vim.lsp.buf.document_highlight
            callback = function()
                pcall(vim.lsp.buf.document_highlight)
            end,
        })
        -- remove hl after cursor moves
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
        })

        -- TODO: make a list of clients that i want to do this on
        -- then add it for those clients instead of hard coding
        -- auto format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
                -- in theory this should be one client with the buf number filter
                local clients = vim.lsp.get_clients({ bufnr = event.buf })
                for _, client in ipairs(clients) do
                    if client.name == 'gopls' then
                        vim.lsp.buf.format({ async = true })
                        break -- Stop after finding the first client that supports formatting
                    end
                end
            end,
        })

    end,
})


-- ADDING NEW SERVERS
-- find and install one with :Mason
-- the lspconfig has sane defaults and calls vim.lsp.config(<server>) behind the seens
-- see those here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- or set custom options if needed
-- vim.lsp.enable(<server>) makes sure they launch

---------
-- lua --
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim', 'Keymap' },
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

--------
-- go --
vim.lsp.enable('gopls')
vim.lsp.enable('pyright')
