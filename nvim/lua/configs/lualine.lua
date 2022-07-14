require('lualine').setup{
    options = {
        theme = 'onedark',
        globalstatus = true,
        -- these dont always line up right :(
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
    }
}
