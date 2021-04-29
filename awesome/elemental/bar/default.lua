--need these
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

--might need these
local beautiful = require("beautiful")
local naughty = require("naughty")

local dir = "~/.config/awesome/themes/default/"

mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 3, awful.tag.viewtoggle)
)

awful.screen.connect_for_each_screen(function(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end)))


    -- Each screen has its own tag table.
    awful.tag({ "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫" }, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        --style = {
        --    spacing = 5
        --},
        --widget_template = {
        --        image  = "/home/dylan/.config/awesome/themes/default/taglist/filledtag.png",
        --        resize = true,
        --        widget = wibox.widget.imagebox
        --}
    }

    -- Create the wibox
    local black = "#282c34"
    s.mywibox = awful.wibar({ position = "top", screen = s, bg_normal = black,})

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
	--nothing in the middle
	null,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
