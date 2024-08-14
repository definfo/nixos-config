{ pkgs, config, ... }:
{
  # fonts.fontconfig.enable = true; # fcitx5 may fail to display emoji
  gtk = {
    enable = true;
    # font = {
    # name = "JetBrainsMono Nerd Font";
    # size = 11;
    # };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
    # Declare dark mode and fcitx5 to GTK applications
    # Set IME in GTK config instead of env, see:
    # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
    gtk2.extraConfig = "gtk-im-module=\"fcitx\"";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-im-module = "fcitx";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-im-module = "fcitx";
    };
  };
  # X11 / XWayland configuration
  xresources.properties = {
    "Xft.dpi" = 192;
    "Xcursor.size" = 22;
    "Xcursor.theme" = "Nordzy-cursors";
  };
  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 22;
  };
  # home.language =
  # let
  # defaultLocale = "en_US.UTF-8";
  # extraLocale = "zh_CN.UTF-8";
  # in
  # {
  # base = "${defaultLocale}";
  # ctype = "${extraLocale}";
  # numeric = "${extraLocale}";
  # time = "${extraLocale}";
  # collate = "${extraLocale}";
  # monetary = "${extraLocale}";
  # messages = "${extraLocale}";
  # paper = "${extraLocale}";
  # name = "${extraLocale}";
  # address = "${extraLocale}";
  # telephone = "${extraLocale}";
  # measurement = "${extraLocale}";
  # };
}
