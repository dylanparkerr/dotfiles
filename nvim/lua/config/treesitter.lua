-- on fresh installs, make sure to TSInstall <language>
-- to install the parser for treesitter to actually work
-- go read the readme for sure
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'lua',
        'python',
        'go',
        'java',
        'javascript',
        'json',
        'markdown',
        'bash',
        'sql',
        'dockerfile',
        'terraform',
        'yaml',
    },
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true, }
}

