{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}:
{
  imports =
    [ (import ./bootloader.nix) ]
    ++ [ (import ./bluetooth.nix) ]
    ++ [ (import ./fonts.nix) ] # system-wide font config
    ++ [ (import ./i18n.nix) ] # i18n / inputmethod
    # ++ [ (import ./tty.nix) ] # kmscon emulator
    ++ [ (import ./xserver.nix) ]
    ++ [ (import ./network.nix) ]
    ++ [ (import ./mihomo) ] # Clash-meta config
    ++ [ (import ./pipewire.nix) ]
    ++ [ (import ./program.nix) ]
    ++ [ (import ./security.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./steam.nix) ]
    ++ [ (import ./system.nix) ]
    ++ [ (import ./user.nix) ]
    ++ [ (import ./wayland.nix) ]
    ++ [ (import ./virtualization.nix) ];
}
