{
  pkgs,
  lib,
  inputs,
  host,
  ...
}:
{
  imports = [ inputs.grub2-themes.nixosModules.default ]; # boot.loader.grub2-theme

  # Use systemd-boot
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.systemd-boot.configurationLimit = 10;

  # Dual system boot options
  # Use GRUB when ESP is on a different physical drive
  # Notice that lanzaboote only supports systemd-boot
  boot.loader = {
    grub = {
      enable = true;
      device = lib.mkDefault "nodev";
      efiSupport = true;
      # efiInstallAsRemovable = true;
      useOSProber = lib.mkDefault true;
      configurationLimit = 10;
    };
    # https://github.com/vinceliuice/grub2-themes
    grub2-theme = {
      enable = true;
      # screen = "4k";
      theme = "vimix";
      icon = "color";
      footer = true;
    };
  };
}
