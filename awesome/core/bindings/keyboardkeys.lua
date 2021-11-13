-- imports
local gears = require("gears")
local awful = require("awful")
local user = require("core/logic/user-settings")
local modkey = user.modkey

-- format for setting keys: awful.key( {mod keys}, key, function, {desc} )

-- GLOBAL GLOBAL GLOABL
-- global keybindings that should work regardless of tag or focused client
globalkeys = gears.table.join(
    -- change focused client
    awful.key({ modkey,           }, "j", function() awful.client.focus.byidx( 1) end,{}),
    awful.key({ modkey,           }, "k", function() awful.client.focus.byidx(-1) end,{}),

    -- change position of focused client
    awful.key({ modkey, "Shift"   }, "j", function() awful.client.swap.byidx(  1) end,{}),
    awful.key({ modkey, "Shift"   }, "k", function() awful.client.swap.byidx( -1) end,{}),
 
    -- change width of master client
    awful.key({ modkey,           }, "h", function () awful.tag.incmwfact(-0.05) end,{}),
    awful.key({ modkey,           }, "l", function () awful.tag.incmwfact( 0.05) end,{}),

    -- change number of master clients
    awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incnmaster( 1, nil, true) end,{}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.tag.incnmaster(-1, nil, true) end,{}),

    -- change number of columns of slave clients
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end,{}),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,{}),
    
    -- toggle layout
    awful.key({ modkey,           }, "Tab", function () awful.layout.inc( 1) end,{}),
    awful.key({ modkey, "Shift"   }, "Tab", function () awful.layout.inc(-1) end,{}),

    --media keys
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn.with_shell("pactl set-sink-volume 0 +5%") end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn.with_shell("pactl set-sink-volume 0 -5%") end),
    awful.key({}, "XF86AudioMute", function() awful.spawn.with_shell("pactl set-sink-mute 0 toggle") end),
    awful.key({}, "XF86AudioMicMute", function() awful.spawn.with_shell("pactl set-source-mute 1 toggle") end),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("brightnessctl set 5-") end),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn.with_shell("brightnessctl set +5") end),

    -- launch programs 
    awful.key({ modkey,           }, "Return", function() awful.spawn(user.terminal) end,{}),
    awful.key({ modkey,           }, "space", function() awful.spawn.with_shell("rofi -show run") end,{}),
    awful.key({ modkey,           }, "b", function() awful.spawn(user.browser) end,{}),
    awful.key({ modkey,           }, "r", function() awful.spawn(user.terminal.." -e ranger") end,{}),

    -- infrequently used
    -- change screens, i never really use this
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,{}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,{}),
    -- jump to urgent window, idk if i'll ever need this
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,{}),
    -- awesome binds
    awful.key({ modkey, "Control" }, "r", awesome.restart,{}),
    awful.key({ modkey, "Control" }, "q", awesome.quit,{}),
    -- unminizing a client has to be global because the client loses focus
    awful.key({ modkey, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,{}
    )
)--end gears.table.join

-- bind number keys to thier corresponding tags
-- add these to the globalkeys table we just made
-- i think ("#" .. i + 9) as the key pressed corresponds to keycodes
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,

        -- switch to a tag number
        awful.key({ modkey }, "#" .. i + 9,
        function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end,{}),

        -- preview tags contents on current tag
        awful.key({ modkey, "Control" }, "#" .. i + 9,
        function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,{}),

        -- move focused client to tag
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function ()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,{})

    )--end gears.table.join
end --end do loop
root.keys(globalkeys) -- Set global keys




-- CLIENT CLIENT CLIENT
-- keybindings specific to the focused client
clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f", function(c) c.fullscreen = not c.fullscreen c:raise() end,{}), -- toggle fullscreen
    awful.key({ modkey,           }, "m", function(c) c.maximized = not c.maximized c:raise() end,{}), -- toggle maximize
    awful.key({ modkey,           }, "n", function(c) c.minimized = true end,{}), -- minimize client
    awful.key({ modkey,           }, "c", function(c) c:kill() end,{}) --close client
)

