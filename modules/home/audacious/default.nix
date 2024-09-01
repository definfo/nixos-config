{ pkgs, ... }:
{
  home.packages = with pkgs.nur.repos.definfo; [ audacious ];
  xdg.configFile."audacious/config".source = ./config;
}
