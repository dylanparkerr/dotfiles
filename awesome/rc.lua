-- AWESOMEWM 
pcall(require, "luarocks.loader")
require("awful.autofocus")

-- error handling
require("core/logic/error-handling")

-- set theme and render wallpaper
require("core/logic/appearance")

-- statusbar
require("core/components/statusbar/default/statusbar")

-- client titlebars
require("core/components/titlebar/default/titlebar")

-- set global and clinet key binds
require("core/bindings/keyboardkeys")

-- set global and client mouse button actions
require("core/bindings/mousebuttons")

-- signals emmited by clients (windows)
require("core/logic/signals")

-- Rules to apply to new clients (through the "manage" signal).
require("core/logic/rules")
