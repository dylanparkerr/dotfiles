require('rainbow-delimiters').setup{
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
    },
    query = {
        [''] = 'rainbow-delimiters',
    },
    highlight = {
        'RainbowDelimiterOrange',
        'RainbowDelimiterViolet',
        'RainbowDelimiterYellow',
        'RainbowDelimiterCyan',
        'RainbowDelimiterRed',
        'RainbowDelimiterGreen',
        'RainbowDelimiterBlue',
    },
    blacklist = {'c', 'cpp'},
}
