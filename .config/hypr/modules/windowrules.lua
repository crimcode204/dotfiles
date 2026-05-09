-- Reserved workspaces
hl.window_rule({
  match = {
    class = "steam",
    title = "Steam",
  },
  workspace = "8 silent",
})
hl.window_rule({
  match = {
    class = "[sS]potify",
  },
  workspace = "9 silent",
})
hl.window_rule({
  match = {
    class = "(org.keepassxc.)?KeePassXC",
  },
  workspace = "10 silent"
})
hl.window_rule({
  match = {
    class = "(org.qbittorrent.)?qBittorrent",
    title = "^(qbittorrent)(.*)"
  },
  workspace = "10 silent"
})

-- Idle inhibitor for proton games
hl.window_rule({
  match = {
    class = "^(steam_app_)(.*)"
  },
  idle_inhibit = "focus"
})

-- KeePass popups
hl.window_rule({
  match = {
    title = "(Unlock Database - KeePassXC)|(KeePassXC -  Access Request)|(KeePassXC - Browser Access Request)"
  },
  float = true,
  center = true,
  no_initial_focus = false,
  stay_focused = true,
})

-- Wlogout
hl.window_rule({
  match = {
    class = "wlogout"
  },
  move = "{0, 0}",
  size = "{1920 1080}",
  float = true
})

-- Fix XWayland dragging
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})
