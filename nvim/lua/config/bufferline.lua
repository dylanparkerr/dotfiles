require("bufferline").setup()
-- so that when using :BuffLineMovePrev and :BuffLineMoveNext to order buffers
-- the new internal order is accessable when using :bnext and :bprevious
vim.opt.sessionoptions:append('globals')
-- todo make bindings for BuffLineMove{Dir}
