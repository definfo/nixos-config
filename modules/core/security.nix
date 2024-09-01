{ ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };

  # FIXME: wechat-uos upstream issue
  # WORKAROUND: add permittedInsecurePackages
  # nixpkgs.config.permittedInsecurePackages = [
  # "electron-19.0.7"
  # "openssl-1.1.1w"
  # ];
}
