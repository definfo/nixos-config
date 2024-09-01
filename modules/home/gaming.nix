{ pkgs, inputs, ... }:
{
  home.packages =
    let
      gamePkgs = inputs.nix-gaming.packages.${pkgs.system};
    in
    with pkgs;
    [
      ## Utils
      gamemode
      gamescope
      winetricks
      gamePkgs.wine-ge
      gamePkgs.osu-stable

      ## Cli games
      _2048-in-terminal
      vitetris
      nethack

      ## Celeste
      # celeste-classic
      # celeste-classic-pm

      ## Doom
      # gzdoom
      # crispy-doom

      ## Emulation
      # sameboy
      # snes9x
      # cemu
      # dolphin-emu
    ];
}
