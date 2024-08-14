{ pkgs, lib, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) {
      nativeMessagingHosts = with pkgs; [
        gnome-browser-connector # Gnome shell native connector
        tridactyl-native # Tridactyl native connector
      ];
    };
    policies = {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      FirefoxHome = {
        Pocket = false;
        Snippets = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
      # add policies here...

      # ---- EXTENSIONS ----
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "force_installed";
            };
          };
        in
        listToAttrs [
          (extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "tabliss" "extension@tabliss.io")
          # (extension "umatrix" "uMatrix@raymondhill.net")
          (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "darkreader" "addon@darkreader.org")
          (extension "恢复标签页" "{b184d107-461b-4cfe-b4ba-771406e90c48}")
          (extension "violentmonkey" "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}")
          (extension "pakkujs" "{646d57f4-d65c-4f0d-8e80-5800b92cfdaa}")
          (extension "immersive-translate" "{5efceaa7-f3a2-4e59-a54b-85319448e305}")

          (extension "ublock-origin" "uBlock0@raymondhill.net")

          # ? if ublock-origin fails to install due to regional restriction
          # {
          # name = "uBlock0@raymondhill.net";
          # value = {
          # install_url = "https://github.com/gorhill/uBlock/releases/download/1.58.0/uBlock0_1.58.0.firefox.signed.xpi";
          # installation_mode = "force_installed";
          # };
          # }

          # (extension "tridactyl-vim" "tridactyl.vim@cmcaine.co.uk")

          # tridactyl beta version without new-tab management
          # view the main help page by typing :help
          # access the tutorial with :tutor
          # :apropos useful for finding relevant settings and commands
          # view your current configuration with :viewconfig
          {
            name = "tridactyl.vim.betas.nonewtab@cmcaine.co.uk";
            value = {
              install_url = "https://tridactyl.cmcaine.co.uk/betas/nonewtab/tridactyl_no_new_tab_beta-latest.xpi";
              installation_mode = "force_installed";
            };
          }
        ];
      # To add additional extensions, find it on addons.mozilla.org, find
      # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = rec {
            uiTheme = "dark";
            uiAccentCustom = true;
            uiAccentCustom0 = "#8300ff";
            cloudStorageEnabled = lib.mkForce false; # Security liability?
            importedLists = [
              "https://filters.adtidy.org/extension/ublock/filters/3.txt"
              "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            ];
            externalLists = lib.concatStringsSep "\n" importedLists;
          };
          selectedFilterLists = [
            # "ALB-0"
            # "BGR-0"
            "CHN-0"
            # "CZE-0"
            # "DEU-0"
            # "EST-0"
            # "FIN-0"
            # "FRA-0"
            # "GRC-0"
            # "HRV-0"
            # "HUN-0"
            # "IDN-0"
            # "IND-0"
            # "IRN-0"
            # "ISL-0"
            # "ISR-0"
            # "ITA-0"
            # "JPN-1"
            # "KOR-1"
            # "LTU-0"
            # "LVA-0"
            # "MKD-0"
            # "NLD-0"
            # "NOR-0"
            # "POL-0"
            # "POL-2"
            # "ROU-1"
            # "RUS-0"
            # "SVN-0"
            # "SWE-1"
            # "THA-0"
            # "TUR-0"
            # "VIE-1"
            "adguard-cookies"
            "adguard-generic"
            # "adguard-mobile"
            # "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-social"
            "adguard-spyware"
            "adguard-spyware-url"
            "adguard-widgets"
            # "ara-0"
            # "block-lan"
            # "curben-phishing"
            # "dpollock-0"
            "easylist"
            "easylist-annoyances"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easyprivacy"
            "fanboy-cookiemonster"
            "fanboy-social"
            "fanboy-thirdparty_social"
            "plowe-0"
            # "spa-0"
            # "spa-1"
            "ublock-annoyances"
            "ublock-badlists"
            "ublock-badware"
            "ublock-cookies-adguard"
            "ublock-cookies-easylist"
            "ublock-filters"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "urlhaus-1"
            "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
          ];
        };
      };

      # ---- PREFERENCES ----
      # Set preferences shared by all profiles.
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "standard";
          Status = "locked";
        };
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-true;
        # add global preferences here...
      };
    };

    # ---- PROFILES ----
    # Switch profiles via about:profiles page.
    # For options that are available in Home-Manager see
    # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
    profiles = {
      profile_0 = {
        # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
        id = 0; # 0 is the default profile; see also option "isDefault"
        name = "profile_0"; # name as listed in about:profiles
        isDefault = true; # can be omitted; true if profile ID is 0
        settings = {
          # specify profile-specific preferences here; check about:config for options
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.startup.homepage" = "https://nixos.org";
          # "browser.newtabpage.pinned" = [
          #   {
          #     title = "NixOS";
          #     url = "https://nixos.org";
          #   }
          # ];
          "browser.link.open_newwindow" = true;
          # add preferences for profile_0 here...
          # "widget.wayland.fractional-scale.enabled" = lock-true;
          # "layout.css.devPixelsPerPx" = 2.0;
        };
      };
      profile_1 = {
        id = 1;
        name = "profile_1";
        isDefault = false;
        settings = {
          "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
          "browser.startup.homepage" = "https://ecosia.org";
          # add preferences for profile_1 here...
        };
      };
      # add profiles here...
    };
  };
}
