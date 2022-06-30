require('onedark').setup({
    colors = {
        white = '#FFFFFF',
        fg = "#abb2bf",
        purple = "#c678dd",
		green = "#98c379",
		orange = "#d19a66",
		blue = "#61afef",
		yellow = "#e5c07b",
		cyan = "#56b6c2",
		red = "#e86671",
    },
    highlights = {
        -- rainbowcol1 = {fg = '$fg'},
        rainbowcol1 = {fg = '$yellow'},
        rainbowcol2 = {fg = '$purple'},
        rainbowcol3 = {fg = '$blue'},
        rainbowcol4 = {fg = '$yellow'},
        rainbowcol5 = {fg = '$purple'},
        rainbowcol6 = {fg = '$blue'},
        rainbowcol7 = {fg = '$fg'},
        -- rainbowcol4 = {fg = '$orange'},
        -- rainbowcol5 = {fg = '$cyan'},
        -- rainbowcol6 = {fg = '$red'},
        -- rainbowcol7 = {fg = '$green'},
    }
})

require('onedark').load() -- pretty sure this needs to be called before others
