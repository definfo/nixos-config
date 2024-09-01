{ ... }:
{
  home.sessionVariables = {
    EDITOR = "vim";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DIRENV_LOG_FORMAT = "";

    # Qt / GTK
    DISABLE_QT5_COMPAT = "0";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_ENABLE_HIGHDPI_SCALING = "1";
    # QT_SCALE_FACTOR = "2"; # use `xresources.properties.Xft.dpi` for xwayland
    QT_QPA_PLATFORM = "wayland;xcb";
    # QT_QPA_PLATFORMTHEME = "qt5ct:qt6ct"; # managed by qt.nix
    # QT_STYLE_OVERRIDE = "kvantum"; # managed by qt.nix
    GTK_THEME = "Dracula";
    GDK_BACKEND = "wayland";
    GDK_SCALE = "2"; # GDK_SCALE variable won't conflict with Wayland-native GTK programs
    # XCURSOR_THEME = "Nordzy-cursors"; # managed by gtk.nix
    # XCURSOR_SIZE = "22"; # managed by gtk.nix

    # Nvidia GBM Backend
    GBM_BACKEND = "nvidia-drm"; # maybe incompatible with firefox
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Sync
    __GL_GSYNC_ALLOWED = "0"; # G-Sync
    # __GL_SYNC_TO_VBLANK = "0"; # V-Sync
    __GL_VRR_ALLOWED = "0"; # Adaptive Sync

    # Hardware acceleration
    LIBVA_DRIVER_NAME = "nvidia"; # Nvidia VA-API
    # LIBVA_DRIVER_NAME = "iHD"; # Intel VA-API

    # wlroots 
    # WLR_DRM_NO_ATOMIC = "1"; # Not recommended if kernel version >= 6.8
    WLR_BACKEND = "vulkan";
    # WLR_RENDERER = "vulkan"; # incompatible with nvidia-prime
    # WLR_NO_HARDWARE_CURSORS = "1"; # deprecated, use cursor:no_hardware_cursors instead

    # Firefox
    # Ref: https://wiki.archlinux.org/title/Firefox/Tweaks
    MOZ_ENABLE_WAYLAND = "1"; # Enable wayland
    MOZ_USE_XINPUT2 = "1"; # Enable one-to-one trackpad scrolling
    MOZ_DBUS_REMOTE = "1"; # Enable exclusive use of DBUS remote;

    # Misc
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
  };
}
