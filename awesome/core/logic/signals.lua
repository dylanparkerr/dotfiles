local awful = require("awful")
local beautiful = require("beautiful")

-- signals are like events that an trigger code
    
-- manage signal happens when a new window is spawned
client.connect_signal("manage", function (c)
    -- set new windows as slaves instead of new master
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- signals for when a client gains or loses focus
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
