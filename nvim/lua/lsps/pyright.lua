local pyright_bin = "/home/dylan/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"

require'lspconfig'.pyright.setup{
    cmd = {pyright_bin, "--stdio"};
}
