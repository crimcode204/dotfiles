-- Key mods
local function main_mod(key)
  return "SUPER + " .. key
end
local function app_mod(key)
  return main_mod("CTRL + " .. key)
end
local function shift_mod(key)
  return main_mod("SHIFT + " .. key)
end

-- Apps
local function app_disp(app_name)
  return hl.dsp.exec_cmd("uwsm-app -- " .. app_name)
end
local wofi = [["$(wofi --show drun --define=drun-print_desktop_file=true | sed -E "s/(\.desktop) /\1:/")"]]

hl.bind(app_mod("F"), app_disp("zen-browser"))
hl.bind(app_mod("S"), app_disp("steam"))
hl.bind(app_mod("L"), app_disp("lutris"))
hl.bind(app_mod("D"), app_disp("discord"))
hl.bind(app_mod("Y"), app_disp("kitty yazi"))
hl.bind(main_mod("Q"), app_disp("kitty"))
hl.bind(main_mod("R"), app_disp(wofi))
hl.bind(main_mod("Escape"), app_disp("wlogout"))

-- Spotify
local function spotify_disp(command)
  return hl.dsp.exec_cmd("playerctl --player=spotify " .. command)
end

hl.bind(shift_mod("bracketright"), spotify_disp("play-pause"), { locked = true, repeating = true })
hl.bind(shift_mod("bracketleft"), spotify_disp("previous"), { locked = true, repeating = true })
hl.bind(shift_mod("backslash"), spotify_disp("next"), { locked = true, repeating = true })
hl.bind(shift_mod("semicolon"), spotify_disp("position 10-"), { locked = true, repeating = true })
hl.bind(shift_mod("apostrophe"), spotify_disp("position 10+"), { locked = true, repeating = true })
hl.bind(shift_mod("comma"), spotify_disp("volume 0.05-"), { locked = true, repeating = true })
hl.bind(shift_mod("period"), spotify_disp("volume 0.05+"), { locked = true, repeating = true })

-- Backlight
hl.bind(main_mod("F7"), hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })
hl.bind(main_mod("F8"), hl.dsp.exec_cmd("brightnessctl s +10%"), { locked = true, repeating = true })

-- Screenshots
-- TODO maybe put the file path in a variable
hl.bind(main_mod("PRINT"), app_disp("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind(shift_mod("PRINT"), app_disp("hyprshot -m output -o ~/Pictures/Screenshots"))

-- Active window properties
hl.bind(main_mod("C"), hl.dsp.window.close())
hl.bind(main_mod("P"), hl.dsp.window.fullscreen())
hl.bind(main_mod("V"), hl.dsp.window.float({ action = "toggle" }))
--hl.bind(main_mod("T"), hl.dsp.layout("togglesplit"))

-- Window move/resize (mouse)
hl.bind(main_mod("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Change focus
hl.bind(main_mod("H"), hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod("L"), hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod("K"), hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod("J"), hl.dsp.focus({ direction = "down" }))

-- Swap windows
hl.bind(shift_mod("H"), hl.dsp.window.move({ direction = "left" }))
hl.bind(shift_mod("L"), hl.dsp.window.move({ direction = "right" }))
hl.bind(shift_mod("K"), hl.dsp.window.move({ direction = "up" }))
hl.bind(shift_mod("J"), hl.dsp.window.move({ direction = "down" }))

-- Switch/move window to workspace
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(main_mod(key), hl.dsp.focus({ workspace = i }))
  hl.bind(shift_mod(key), hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(main_mod("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Close hyprland
hl.bind(main_mod("M"),
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
