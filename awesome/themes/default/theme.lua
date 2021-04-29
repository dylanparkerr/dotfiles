---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local beautiful = require("beautiful")

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"

local theme = {}

theme.wallpaper = "~/.config/awesome/themes/default/arch.png"

theme.font          = "sans 8"

local background = "#282c34"
local black = "#4b5263"
local lightblack = "#5c6370"
local white = "#abb2bf"
local red = "#e06c75"
local green = "#98c379"
local blue = "#61AFEF"
local purple = "#c678dd"

theme.bg_normal     = background 
theme.bg_focus      = background 
theme.bg_urgent     = background 
theme.bg_minimize   = background
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = lightblack 
theme.border_marked = white 


theme.taglist_fg_focus = purple 
theme.taglist_fg_empty = green 
theme.taglist_fg_occupied = blue 

theme.taglist_font = "sans 8 20"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]


-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/min.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/min.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/max.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/max.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/max.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/max.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"


-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
