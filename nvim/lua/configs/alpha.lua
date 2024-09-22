local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- padding at the top of the page
dashboard.config.layout[1] = { type = "padding", val = 12 }

-- header color
dashboard.section.header.opts.hl = 'String'

-- button options
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > new file" , ":ene <BAR> startinsert <CR>", {}),
    dashboard.button( "space ff", "🔍 > find file", ":Telescope find_files<CR>", {}),
    dashboard.button( "space pp", "  > find project"   , ":Telescope projects<CR>", {}),
    dashboard.button( "space fh", "⁇  > find help" , ":Telescope help_tags<cr>", {}),
}

-- footer
local function footer()
    local version = vim.version()
    local nvim_version_info = "v" .. version.major .. "." .. version.minor .. "." .. version.patch

    local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath('data') .. '/site/pack/packer/start', '*', 0, 1)
    local plugins = string.format("  -   Loaded %d plugins", num_plugins_loaded)

    return nvim_version_info..plugins
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Function"

-- set config
alpha.setup(dashboard.opts)

