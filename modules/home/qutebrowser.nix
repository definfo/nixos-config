{ pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors = {
        webpage.preferred_color_scheme = "dark";
      };
    };
    searchEngines = {
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      nw = "https://wiki.nixos.org/index.php?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
    };
    greasemonkey =
      let
        userscript = url: sha256: pkgs.fetchurl { inherit url sha256; };
      in
      [
        # Bilibili Evolved (Preview)
        (userscript "https://raw.githubusercontent.com/the1812/Bilibili-Evolved/preview/dist/bilibili-evolved.preview.user.js" "RtR24rKxXnAQ91xBvho/pFPXZAFHEs4VUrMpcmijIjk=")
      ];
    extraConfig = ''
      import os
      from urllib.request import urlopen

      # load your autoconfig, use this, if the rest of your config is empty!
      config.load_autoconfig()

      if not os.path.exists(config.configdir / "theme.py"):
        theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
        with urlopen(theme) as themehtml:
          with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

      if os.path.exists(config.configdir / "theme.py"):
        import theme
        theme.setup(c, 'mocha', True)
    '';
  };
}
