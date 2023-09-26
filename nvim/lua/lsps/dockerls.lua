-- this assumes language server is install with lspinstall
local cmd = ''
if vim.fn.has("unix") == 1 then
    -- cmd = "/home/dylan/.local/share/nvim/lsp_servers/dockerfile/extension/server/bin/lua-language-server"
elseif vim.fn.has('win32') == 1 then
    cmd = "C:\\Users\\dylparke\\AppData\\Local\\nvim-data\\lsp_servers\\dockerfile\\node_modules\\.bin\\docker-langserver.cmd"
end

require'lspconfig'.dockerls.setup {
    cmd = {cmd, "--stdio"}
}
