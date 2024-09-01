{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "high-quality" ];
    scripts = with pkgs.mpvScripts; [
      mpris
      mpv-cheatsheet
      modernx-zydezu
    ];
  };
}
