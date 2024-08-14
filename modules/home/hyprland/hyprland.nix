{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    # swww
    swaybg
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    grim
    slurp
    wl-clip-persist
    wf-recorder
    glib
    wayland
    direnv
  ];
  home.file."Pictures/wallpapers/wallpaper.png".source = ../../../wallpapers/wallpaper.png;
  home.file."Pictures/wallpapers/others" = {
    source = ../../../wallpapers/otherWallpaper;
    recursive = true;
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    # systemd.enableXdgAutostart = true;
  };
}
