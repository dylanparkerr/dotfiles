vim.pack.add({
    {src = 'https://github.com/williamboman/mason.nvim'}, -- installer for lsp servers, dap servers, linters, and formaters
    {src = 'https://github.com/neovim/nvim-lspconfig'},   -- sane default configs for new servers
})
require('mason').setup()
local keymap = require('core.utils').keymap

vim.lsp.log.set_level("WARN")

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
        keymap('n', 'gm', function() vim.diagnostic.open_float({event.buf}) end, '[g]et [m]ore hover info')
        keymap('n', 'gs', vim.lsp.buf.signature_help, '[g]et [s]ignature')
        keymap('n', 'ga', vim.lsp.buf.code_action, '[g]et code [a]ctions')
        keymap('n', 'gf', vim.lsp.buf.format, '[g]o [f]ormat')
        keymap('n', 'ge', vim.lsp.buf.rename, '[g]o r[e]name')
        keymap('n', 'gn', function() vim.diagnostic.jump({count=1}) end, '[g]o [n]ext diagnostic')
        keymap('n', 'gp', function() vim.diagnostic.jump({count=-1}) end, '[g]o [p]revious diagnostic')

        -- highlight symbol under cursor
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = function()
                local clients = vim.lsp.get_clients({ bufnr = event.buf })
                for _, client in ipairs(clients) do
                    if client:supports_method("textDocument/documentHighlight") then
                        vim.lsp.buf.document_highlight()
                        break
                    end
                end
            end,
        })
        -- remove hl after cursor moves
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
        })

        -- MAYBE: need to associate filetypes and which server i want to format it
        -- or i might be able to put this ftpluglin configs
        local format_servers = {'gopls'}
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
                local clients = vim.lsp.get_clients({ bufnr = event.buf })
                for _, client in ipairs(clients) do
                    if require('core.utils').contains(format_servers, client.name) then
                        vim.lsp.buf.format({ async = true })
                        break
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

local servers = {
    lua_ls = {
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
    },
    gopls = {},
    pyright = {},
    ts_ls = {},
    angularls = {},
    terraformls = {}
}

for server, config in pairs(servers) do
    if next(config) then
        vim.lsp.config(server, config)
    end
    vim.lsp.enable(server)
end

-- restoring some usefult user commands now that they are gone
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
  desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function(_)
  local state_path = vim.fn.stdpath("state")
  local log_path = vim.fs.joinpath(state_path, "lsp.log")

  vim.cmd(string.format("edit %s", log_path))
end, {
  desc = "Show LSP log",
})
