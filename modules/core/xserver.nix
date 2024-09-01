{ username, ... }:
{
  services = {
    xserver.enable = true;

    # displayManager.autoLogin = {
    # enable = true;
    # user = "${username}";
    # };
    # displayManager.defaultSession = "hyprland";

    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "${username}"; # Hyprland is installed only for current user via home-manager!
          command = "Hyprland"; # start Hyprland directly without a login manager
          # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";  # start Hyprland with a TUI login manager
        };
      };
    };

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
