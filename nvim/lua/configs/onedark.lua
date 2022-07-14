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
        rainbowcol1 = {fg = '$orange'},
        -- rainbowcol2 = {fg = '$purple'},
        -- rainbowcol3 = {fg = '$blue'},
        -- rainbowcol4 = {fg = '$orange'},
        -- rainbowcol5 = {fg = '$purple'},
        -- rainbowcol6 = {fg = '$blue'},
        rainbowcol7 = {fg = '$fg'},
        rainbowcol2 = {fg = '$purple'},
        rainbowcol3 = {fg = '$orange'},
        rainbowcol4 = {fg = '$purple'},
        rainbowcol5 = {fg = '$orange'},
        rainbowcol6 = {fg = '$purple'},
        TSOperator = {fg = '$purple'}
    }
})

require('onedark').load() -- pretty sure this needs to be called before others
