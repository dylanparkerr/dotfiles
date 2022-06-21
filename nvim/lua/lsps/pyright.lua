-- local pyright_bin = "/home/dylan/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"
local cmd = ''
if vim.fn.has("unix") == 1 then
    cmd = "/home/dylan/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"
elseif vim.fn.has('win32') == 1 then
    cmd = "C:\\Users\\Dylan\\AppData\\Local\\nvim-data\\lsp_servers/python/node_modules/.bin/pyright-langserver.exe"
end

require'lspconfig'.pyright.setup{
    cmd = {cmd, "--stdio"};
    -- cmd = {pyright_bin, "--stdio"};
}
