{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings =
      let
        extraLocale = "zh_CN.UTF-8";
      in
      {
        LC_CTYPE = "${extraLocale}";
        LC_NUMERIC = "${extraLocale}";
        LC_TIME = "${extraLocale}";
        LC_COLLATE = "${extraLocale}";
        LC_MONETARY = "${extraLocale}";
        LC_MESSAGES = "${extraLocale}";
        LC_PAPER = "${extraLocale}";
        LC_NAME = "${extraLocale}";
        LC_ADDRESS = "${extraLocale}";
        LC_TELEPHONE = "${extraLocale}";
        LC_MEASUREMENT = "${extraLocale}";
        LC_IDENTIFICATION = "${extraLocale}";
      };
  };
  i18n.inputMethod = {
    # enabled = "fcitx5"; # deprecated
    enable = true;
    type = "fcitx5";
    fcitx5.ignoreUserConfig = false; # see modules/home/fcitx5.nix
    fcitx5.waylandFrontend = true; # NOT to set GTK_IM_MODULE=fcitx
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-chinese-addons
      (fcitx5-rime.override {
        rimeDataPkgs = with pkgs.nur.repos.linyinfeng.rimePackages; withRimeDeps [ rime-ice ];
      })
      fcitx5-mozc
      fcitx5-gtk
      # fcitx5-nord
      catppuccin-fcitx5
    ];
  };
}
