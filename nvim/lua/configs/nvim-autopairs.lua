require('nvim-autopairs').setup()

-- If you want insert `(` after selecting a function or method from cmp completion
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
