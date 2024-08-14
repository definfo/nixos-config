{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    package = pkgs.betterbird;
    profiles = {
      profile-1 = {
        isDefault = true;
      };
    };
  };
}
