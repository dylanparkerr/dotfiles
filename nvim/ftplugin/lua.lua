vim.pack.add({
    {src = 'https://github.com/folke/lazydev.nvim'}, -- dynamically adds plugins to lua_ls workspace enabling enables completions from lsp
})
require('lazydev').setup()

-- vim.o.tabstop=2
-- vim.o.shiftwidth=2
