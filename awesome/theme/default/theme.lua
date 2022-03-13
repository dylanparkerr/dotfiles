------------------------------
-- my default onedark theme --
------------------------------
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local home = os.getenv("HOME")
local themepath = home.."/.config/awesome/theme/default/"

local theme = {}

-------------------------------------------------------------------------------
local colors = {
    background = '#282c34',
    foreground = '#abb2bf',
    black = '#17191e',
    grey = '#5c6370',
    purple = '#c678dd',
    green = '#98c379',
    orange = '#d19a66',
    blue = '#61afef',
    yellow = '#e5c07b',
    cyan = '#56b6c2',
    red = '#e86671'
}

-- wallpaper
theme.wallpaper = themepath.."wallpaper/arch.png"

-- font
theme.font          = "sans 10"

--titlebar and statusbar
theme.bg_normal     = colors.background
theme.bg_focus      = colors.background
theme.bg_minimize   = colors.background
theme.bg_systray    = colors.background
theme.bg_urgent     = colors.red

--text
theme.fg_normal     = colors.foreground
theme.fg_focus      = colors.foreground
theme.fg_minimize   = colors.foreground
theme.fg_urgent     = colors.black

--borders
theme.border_width  = dpi(1)
theme.border_marked = colors.lightgrey
theme.border_normal = colors.black
theme.border_focus  = colors.grey

--color of the taglist text
theme.taglist_fg_focus = colors.green
theme.taglist_fg_empty = colors.blue
theme.taglist_fg_occupied = colors.purple
theme.taglist_font = "sans 14"

-- titlebar buttons
-- close
theme.titlebar_close_button_normal = gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.red)
theme.titlebar_close_button_focus = gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.red)
-- min
theme.titlebar_minimize_button_normal =gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.purple)
theme.titlebar_minimize_button_focus  =gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.purple)
-- max
theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.green)
theme.titlebar_maximized_button_focus_inactive  =gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.green)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.green)
theme.titlebar_maximized_button_focus_active  =gears.color.recolor_image(themepath.."assets/titlebar/circle.png",colors.green)

-- layout icons
theme.layout_max = themepath.."assets/layouts/maxw.png"
theme.layout_tile = themepath.."assets/layouts/tilew.png"
theme.layout_floating  = themepath.."assets/layouts/floatingw.png"


-------------------------------------------------------------------------------
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.menu_height = dpi(15) --this has to be here or the statusbar goes nuts
--theme.menu_submenu_icon = themes_path.."default/submenu.png"
--theme.menu_width  = dpi(100)

return theme
