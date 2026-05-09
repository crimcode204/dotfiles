-- Expand PATH
hl.env("PATH", "$PATH:/home/Alladin/.cargo/bin")

-- Toolkits
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("SLD_VIDEO_BACKEND", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Fuck Nvidia
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("NVD_BACKEND", "direct")
hl.env("__GL_GSYNC_ALLOWED", "1")

-- Fuck Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Zsh config path
hl.env("ZDOTDIR", "$HOME/.config/zsh")

-- SSH agent
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")

-- Defaults
hl.env("SHELL", "/usr/bin/zsh")
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
hl.env("BROWSER", "zen-browser")
hl.env("CXX", "/usr/bin/clang++")
hl.env("CC", "/usr/bin/clang")

-- Man pages with neovim
hl.env("MANPAGER", "nvim +Man!")

-- Firefox gpu acceleration
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

-- Cursor theme
hl.env("HYPRCURSOR_THEME", "theme_phinger-cursors-dark")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "phinger-cursors-dark")
hl.env("XCURSOR_SIZE", "24")
