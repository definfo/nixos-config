{ pkgs-stable, ... }:
{
  programs.thunderbird = {
    enable = true;
    package = pkgs-stable.betterbird;
    profiles = {
      profile-1 = {
        isDefault = true;
      };
    };
  };
}
