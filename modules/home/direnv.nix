{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    # enableFishIntegration = true;
    enableZshIntegration = true;
    # enableNushellIntegration = true;
    nix-direnv = {
      enable = true;
      # package = pkgs.nix-direnv;
    };
  };
}
