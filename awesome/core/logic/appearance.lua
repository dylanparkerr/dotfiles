local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local home = os.getenv("HOME")
local themedir = home.."/.config/awesome/theme/"

-------------------------------------------------------------------------------


--CHOOSE THEME
local theme = "default"


-------------------------------------------------------------------------------
--CHOOSE THEME
-- set theme
beautiful.init(themedir..theme.."/theme.lua")
-- set gaps
beautiful.useless_gap = 8
beautiful.gap_single_client = true

-- wallpaper logic
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
end)
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
