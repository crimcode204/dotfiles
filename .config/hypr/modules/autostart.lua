hl.on("hyprland.start", function()
  -- Polkit agent
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Usb mount utility
  hl.exec_cmd("uwsm-app -- udiskie")

  -- Wallpaper
  hl.exec_cmd("uwsm-app -- hyprpaper")

  -- Idle daemon
  hl.exec_cmd("uwsm-app -- hypridle")

  -- Status bar
  hl.exec_cmd("uwsm-app -- quickshell")

  -- Apps
  hl.exec_cmd("uwsm-app -- spotify-launcher")
  hl.exec_cmd("uwsm-app -- keepassxc")
  hl.exec_cmd("uwsm-app -- syncthing")
  hl.exec_cmd("uwsm-app -- qbittorrent")
end)
