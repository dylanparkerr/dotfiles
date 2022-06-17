-- on fresh installs, make sure to TSInstall <language>
-- to install the parser for treesitter to actually work
-- go read the readme for sure
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    }
}

