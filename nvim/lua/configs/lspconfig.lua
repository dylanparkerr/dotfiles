-- LSP configuration
--   lsp based keybindings
--   enabling features based on lsp servers
--   installing/configuring lsp servers (via mason/mason-lspconfig)
--   installing/configuring other linters and formatters

-- LspAttach is a special event (see :help LspAttach) that triggers when an LSP server attaches to a buffer
-- so these mappings will be set
vim.api.nvim_create_autocmd('LspAttach', {

    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),

    callback = function(event)
        -- keybind map helper
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local telescope = require('telescope.builtin')

        map('gd', telescope.lsp_definitions, '[g]o to [d]efinition')           --lsp go to definition - shows telescope picker if there are multiple entries
        map('gr', telescope.lsp_references, '[g]o to [r]eferences')            --lsp go to symbol refrences - shows telescope picker if there are multiple entries
        map('gi', telescope.lsp_implementations, '[g]o to [i]mplementations')  --lsp go to implementation - shows telescope picker if there are multiple entries
        map('gt', telescope.lsp_type_definitions, '[g]o to [t]ype definition') --lsp go to type definition - shows telescope picker if there are multiple entries
        map('gh', vim.lsp.buf.hover, '[g]et [h]over information')
        map('gs', vim.lsp.buf.signature_help, '[g]et [s]ignature')
        map('ga', vim.lsp.buf.code_action, '[g]et code [a]ctions')
        map('gf', vim.lsp.buf.format, '[g]et code [f]ormat')
        map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame token')

        -- some nice highlighting
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
        })
        -- remove hl after cursor moves
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
        })

        -- this was created with the help of chatgpt
        -- i think this looks right but this could cause issues in the future if multiple clients are attached and not in the order i need
        -- not going to over engineer this for now until the need arises
        -- setting it to work only for gopls right now
        --
        -- this is me coming back after something like a year.. 
        -- i dont think this needs to be a for loop
        -- i can just format the current buffer..
        -- if it supports it.. but not sure why that if statement didnt work
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
                -- Check if LSP formatting is supported for the buffer
                local clients = vim.lsp.get_active_clients({ bufnr = event.buf })
                for _, client in ipairs(clients) do
                    -- if client.supports_method('textDocument/formatting')  then
                    if client.name == 'gopls' then
                        vim.lsp.buf.format({ async = true })
                        break -- Stop after finding the first client that supports formatting
                    end
                end
            end,
        })
    end,
})


-- courtesy of TJ
-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP Specification.
--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


-- ************** NOTE **************
-- if i remove mason/masnon-lsp-config in the future this will need to be refactored
--
-- this is a custum object from TJ that we will iterate over and setup
-- key names(servers) like lua_ls correspond to the names of lspconfig objects that have a setup function
-- e.g require('lspconfig').lua_ls.setup() is how I used to do this
-- servers and their configs here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- to uninstall a server use :Mason and X on the server, and remove from this table
local servers = {
    lua_ls = {
        filetypes = { 'lua' }, -- had to add this as luals was attaching to java files, not sure why
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' }, -- vim is indeeed a global
                },
                workspace = {
                    checkThirdParty = false,
                    -- Make the server aware of Neovim runtime files
                    library = {
                        '${3rd}/luv/library',
                        unpack(vim.api.nvim_get_runtime_file('', true)),
                    },
                    -- TJ mentions to try this instead of lua is running slow
                    -- library = { vim.env.VIMRUNTIME },
                },

                telemetry = {
                    enable = false,
                },
            },
        },
        capabilities = {}
    },
    pyright = {},
    -- tsserver = {},
    gopls = {},
    jdtls = {},
    terraformls = {},
    -- bashls = {},
    -- rust_analyzer = {},
}

-- ensure that the servers defined above are installed by using mason tool installer
local ensure_installed = vim.tbl_keys(servers)
-- vim.list_extend(ensure_installed, {
--     'google-java-format', -- figure this out later
-- })
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

-- mason-lspconfig here makes sure that servers are setup
require('mason-lspconfig').setup {
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            require('lspconfig')[server_name].setup {
                cmd = server.cmd,
                settings = server.settings,
                filetypes = server.filetypes,
                -- This handles overriding only values explicitly passed
                -- by the server configuration above. Useful when disabling
                -- certain features of an LSP (for example, turning off formatting for tsserver)
                -- the inclusion of the capabilites table from above makes sure nvim-cmp is added
                capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            }
        end,
    },
}
