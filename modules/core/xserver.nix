{ pkgs, username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      # displayManager.lightdm.enable = true; # LightDM is enabled by default
    };

    # https://wiki.archlinux.org/title/Greetd
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "${username}"; # Hyprland is installed only for user via home-manager!
          command = "Hyprland"; # directly start Hyprland without login manager
          # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";  # start Hyprland with a TUI login manager
        };
      };
    };

    # displayManager.autoLogin = {
    # enable = true;
    # user = "${username}";
    # };
    # displayManager.defaultSession = "hyprland";

    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
