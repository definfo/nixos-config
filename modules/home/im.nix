{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    qq

    # TODO: wait for upstream fix, use flatpak as workaround
    # (wechat-uos.override {
    # uosLicense = pkgs.fetchurl {
    # # https://github.com/NixOS/nixpkgs/pull/305929
    # url = "https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos-bwrap";
    # hash = "";
    # };
    # })

    nur.repos.mur.ayugram-desktop # 3rd-party telegram

    # nur.repos.xddxdd.kikoplay
  ];
}
