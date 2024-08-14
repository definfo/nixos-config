{ inputs, pkgs, ... }:
{
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      # xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    # config.common.default = "*";
  };
  environment.systemPackages = with pkgs; [
    # xwaylandvideobridge
    xorg.xdpyinfo
  ];
}
