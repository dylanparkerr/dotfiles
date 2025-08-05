vim.pack.add({
    {src = 'https://github.com/Saghen/blink.cmp',               -- fast and fuzzy completion with good defaults included
     version = vim.version.range('1.6.0')},                     -- specific version tag downloads prebuilt binaries since its rust
    {src = 'https://github.com/rafamadriz/friendly-snippets'},  -- bunch of snippets for different languages (blink will auto load this by default)
})
local blink = require('blink.cmp')

-- GATCHA: with lua_ls, sometimes completion will remove text in the remaing of the line..

-- config help: https://cmp.saghen.dev/configuration/general.html
blink.setup({
    sources = {
        -- add lazydev as a provider only with lua files
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority
                score_offset = 100,
            },
        },
        per_filetype = {
            lua = { inherit_defaults = true, 'lazydev' }
        },
    },
    completion = {
        menu = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
            draw = {
                -- this is the default plus the source name (LSP, TEXT, etc.) at the end
                columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, {'source_name'} },
            }
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 1000,
        }
    }
})

-- export for other areas to use
local completion = {}
    completion.capabilities = blink.get_lsp_capabilities({}, false)
return completion
