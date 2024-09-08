{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    qq
    # nur.repos.linyinfeng.icalingua-plus-plus

    # FIXME: wait for upstream fix
    # WORKAROUND: wechat-flatpak
    # (wechat-uos.override {
    # uosLicense = pkgs.fetchurl {
    # # https://github.com/NixOS/nixpkgs/pull/305929
    # url = "https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos-bwrap";
    # hash = "";
    # };
    # })

    telegram-desktop

    nur.repos.xddxdd.kikoplay
  ];
}
