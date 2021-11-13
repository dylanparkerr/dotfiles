local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

client.connect_signal("request::titlebars", function(c)
    -- mouse button functions on titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    -- contentes of the titlebar
    awful.titlebar(c) : setup {
        {-- left
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        }, 
        {-- middle
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        }, 
        { -- right
            {
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.closebutton    (c),
                spacing = dpi(8),
                layout = wibox.layout.fixed.horizontal()
            },
            margins = dpi(6),
		    widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    }
end)
