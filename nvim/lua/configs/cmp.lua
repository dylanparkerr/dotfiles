local cmp = require'cmp'
local luasnip = require('luasnip')
local lspkind = require('lspkind')

require("luasnip/loaders/from_vscode").lazy_load()

-- helper function for super tab functionality
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
    enabled = function()
        ------------------------------------
        -- disable in telescope prompts
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then return false end
        ------------------------------------

        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
            -- and buftype == "prompt"
        end
        -----------------------------------
    end,

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },

    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s",}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
    }, --end mappings

    sources = cmp.config.sources{
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length=5 },
    },

    formatting = {
        format = lspkind.cmp_format({
            menu={
                nvim_lsp = '[lsp]',
                luasnip = '[luasnip]',
                path = '[path]',
                buffer = '[buffer]',
            },
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "🠶",
                Variable = "",
                Class = "∴",
                Interface = "",
                Module = "",
                Property = "🠶",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            },
        })
    },

    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered()
    },
})

--highlights
vim.cmd('highlight! CmpItemKindDefault guibg=NONE guifg=#c678dd')
vim.cmd('highlight! CmpItemAbbrDeprecatedDefault guibg=NONE guifg=#e86671')
