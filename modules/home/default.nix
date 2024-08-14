{
  inputs,
  username,
  host,
  ...
}:
{
  imports =
    [ (import ./aseprite) ] # pixel art editor
    ++ [ (import ./audacious) ] # music player
    ++ [ (import ./bat.nix) ] # better cat command
    ++ [ (import ./btop.nix) ] # resouces monitor
    ++ [ (import ./cava.nix) ] # audio visualizer
    ++ [ (import ./discord.nix) ] # discord with catppuccin theme
    ++ [ (import ./direnv.nix) ] # nix-direnv
    ++ [ (import ./fcitx5.nix) ] # fcitx5 input method
    ++ [ (import ./firefox.nix) ] # firefox customization
    ++ [ (import ./flatpak.nix) ] # flatpak sandbox
    ++ [ (import ./fuzzel.nix) ] # launcher
    ++ [ (import ./gaming.nix) ] # packages related to gaming
    ++ [ (import ./git.nix) ] # version control
    ++ [ (import ./gtk.nix) ] # gtk theme
    ++ [ (import ./im.nix) ] # instant messaging
    ++ [ (import ./helix) ] # helix editor
    ++ [ (import ./hyprland) ] # window manager
    ++ [ (import ./kitty.nix) ] # terminal
    ++ [ (import ./swaync) ] # notification deamon
    ++ [ (import ./micro.nix) ] # nano replacement
    ++ [ (import ./mpv.nix) ] # video player
    ++ [ (import ./nvim.nix) ] # neovim editor
    ++ [ (import ./packages.nix) ] # other packages
    ++ [ (import ./qt.nix) ] # qt theme
    # ++ [ (import ./retroarch.nix) ]
    ++ [ (import ./scripts) ] # personal scripts
    ++ [ (import ./sioyek.nix) ] # pdf reader
    ++ [ (import ./spicetify.nix) ] # spotify client
    ++ [ (import ./starship.nix) ] # shell prompt
    ++ [ (import ./swaylock.nix) ] # lock screen
    ++ [ (import ./tmux.nix) ] # fzf-tmux
    ++ [ (import ./thunderbird.nix) ] # thunderbird email client
    ++ [ (import ./vscode.nix) ] # vscode
    ++ [ (import ./waybar) ] # status bar
    ++ [ (import ./xdg.nix) ]
    ++ [ (import ./zsh.nix) ]; # shell
}
