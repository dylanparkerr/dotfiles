vim.pack.add({
    {src = 'https://github.com/Saghen/blink.cmp',
     version = vim.version.range('1.6.0')},
})
local blink = require('blink.cmp')

blink.setup()


-- TODO: completion will remove text in the remaing of the line...
-- that just cannot be

-- export for other areas to use
local completion = {}
completion.capabilities = blink.get_lsp_capabilities({}, false)
return completion
