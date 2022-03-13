local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local markup = lain.util.markup

local icondir = os.getenv("HOME").."/.config/awesome/theme/default/assets/icons/"
local background = "#282c34"
local statusfont = sans
local sep = wibox.widget.textbox(' | ')



-- clock widget
mytextclock = wibox.widget.textclock("%a %b %d, %I:%M ")

-- cpu icon and percentage
local cpuicon = wibox.widget.imagebox(icondir.."cpu.png")
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(statusfont, "" .. cpu_now.usage .. "%  "))
    end
})

-- memory icon and usage
local memicon = wibox.widget.imagebox(icondir.."mem.png")
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(statusfont, " " .. mem_now.used .. "MB "))
    end
})

-- temp icon and reading
local tempicon = wibox.widget.imagebox(icondir.."temp.png")
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(statusfont, " " .. coretemp_now .. "°C "))
    end
})

-- battery icon and percentage 
local baticon = wibox.widget.imagebox(icondir.."battery.png")
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(icondir.."ac.png")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 10 then
                baticon:set_image(icondir.."battery_empty.png")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 25 then
                baticon:set_image(icondir.."battery_low.png")
            else
                baticon:set_image(icondir.."battery.png")
            end
            widget:set_markup(markup.font(sans, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(sans, " NA "))
            baticon:set_image(icondir.."ac.png")
        end
    end
})

-- available layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
}

--todo move to bindings
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
                                if client.focus then
                                    client.focus:move_to_tag(t)
                                end
                            end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
                                if client.focus then
                                    client.focus:toggle_tag(t)
                                end
                            end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)


-- add the status bar to every screen
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    -- i think this is the actually settings, not the visuals
    awful.tag({ "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫", "⚫" }, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    -- mouse button actions on the layout icon
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end))
    )

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }


    -- Create the statusbar
    s.statusbar = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the statusbar
    s.statusbar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        nil,-- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --way to set a different background color
            --wibox.container.background(wibox.widget.imagebox(icondir.."cpu.png"), background),
            --wibox.container.background(cpu.widget, background),
            sep,
            tempicon,
            temp,
            sep,
            cpuicon,
            cpu.widget,
            sep,
            memicon,
            mem.widget,
            sep,
            baticon,
            bat.widget,
            sep,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
