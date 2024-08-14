{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    protontricks = {
      enable = true;
      # package = pkgs.protontricks;
    };
    platformOptimizations.enable = true;
  };
  programs.gamemode.enable = true;
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
    ];
  #   warning: The package proton-ge in nix-gaming has been deprecated as of 2024-03-17.

  # You should use proton-ge-bin from Nixpkgs, which conforms to
  # the new `extraCompatTools` module option under `programs.steam`
  # For details, see the relevant pull request:
}
