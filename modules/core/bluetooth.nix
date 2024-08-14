{ pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    # package = pkgs.bluez;
    powerOnBoot = true;
    # Set configuration for system-wide bluetooth (/etc/bluetooth/main.conf).
    # settings = {};
    # Set configuration for the network service (/etc/bluetooth/network.conf).
    # network = {};
    # Set configuration for the input service (/etc/bluetooth/input.conf).
    # input = {};
  };

  services.blueman.enable = true;

  # Enable support for BT controllers
  # hardware.xpadneo.enable = true;
  # environment.systemPackages = with pkgs; [
  # dualsensectl
  # ];
}
