{ ... }:
{
  imports =
    [ (import ./audio.nix) ] # pipewire
    ++ [ (import ./bluetooth.nix) ]
    ++ [ (import ./bootloader.nix) ]
    ++ [ (import ./fonts.nix) ] # system-wide font config
    ++ [ (import ./i18n.nix) ] # i18n / inputmethod
    ++ [ (import ./network.nix) ]
    ++ [ (import ./mihomo) ] # clash-meta config
    ++ [ (import ./program.nix) ]
    ++ [ (import ./security.nix) ]
    ++ [ (import ./services.nix) ]
    ++ [ (import ./steam.nix) ]
    ++ [ (import ./system.nix) ]
    # ++ [ (import ./tty.nix) ] # kmscon emulator
    ++ [ (import ./user.nix) ]
    ++ [ (import ./video.nix) ] # v4l2loopback
    ++ [ (import ./virtualization.nix) ] # libvirt / podman / waydroid / ...
    ++ [ (import ./wayland.nix) ]
    ++ [ (import ./xserver.nix) ];
}
