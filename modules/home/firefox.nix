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
    languagePacks = [
      "zh-CN"
      "en-US"
    ];
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
      RequestedLocales = "zh-cn,en-us";
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
          # (extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
          (extension "sidebery" "{3c078156-979c-498b-8990-85f7987dd929}")
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
          # (extension "tridactyl-vim" "tridactyl.vim@cmcaine.co.uk")

          # FIXME: unavailable URL for ublock-origin
          # (extension "ublock-origin" "uBlock0@raymondhill.net")
          {
            name = "uBlock0@raymondhill.net";
            value = {
              install_url = "https://github.com/gorhill/uBlock/releases/download/1.58.0/uBlock0_1.58.0.firefox.signed.xpi";
              installation_mode = "force_installed";
            };
          }
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
            "CHN-0"
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
        # Performance settings
        "gfx.webrender.all" = true; # Force enable GPU acceleration
        "gfx.webrender.compositor.force-enabled" = true;
        "media.av1.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "media.hls.enabled" = true;
        "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes
        "reader.parse-on-load.force-enabled" = true;
        "privacy.webrtc.legacyGlobalIndicator" = false;
        # Remove trackers
        "privacy.purge_trackers.enabled" = lock-true;
        "privacy.trackingprotection.enabled" = lock-true;
        "privacy.trackingprotection.fingerprinting.enabled" = lock-true;
        "privacy.resistFingerprinting" = lock-true;
        "privacy.trackingprotection.socialtracking.enabled" = lock-true;
        "privacy.trackingprotection.cryptomining.enabled" = lock-true;
        "privacy.globalprivacycontrol.enabled" = lock-true;
        "privacy.globalprivacycontrol.functionality.enabled" = lock-true;
        "privacy.donottrackheader.enabled" = lock-true;
        "privacy.donottrackheader.value" = 1;
        "privacy.query_stripping.enabled" = lock-true;
        "privacy.query_stripping.enabled.pbmode" = lock-true;
        # Block more unwanted stuff
        "browser.privatebrowsing.forceMediaMemoryCache" = lock-true;
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "locked";
        };
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "privacy.popups.disable_from_plugins" = 3;
        "extensions.pocket.enabled" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "layout.word_select.eat_space_to_next_word" = lock-false;
        "browser.shell.checkDefaultBrowser" = lock-false;
        "signon.rememberSignons" = lock-false;
        "security.insecure_connection_text.enabled" = true;
        "security.insecure_connection_text.pbmode.enabled" = true;
        "security.osclientcerts.autoload" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "toolkit.telemetry.unified" = lock-false;
        "toolkit.telemetry.enabled" = lock-false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = lock-false;
        "toolkit.telemetry.coverage.opt-out" = lock-true;
        "toolkit.coverage.opt-out" = lock-true;
        "toolkit.coverage.endpoint.base" = "";
        "experiments.supported" = lock-false;
        "experiments.enabled" = lock-false;
        "experiments.manifest.uri" = "";
        "browser.ping-centre.telemetry" = lock-false;
        "datareporting.healthreport.uploadEnabled" = lock-false;
        "datareporting.healthreport.service.enabled" = lock-false;
        "datareporting.policy.dataSubmissionEnabled" = lock-false;
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = lock-false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = lock-false;
        "browser.formfill.enable" = lock-false;
        "extensions.formautofill.addresses.enabled" = lock-false;
        "extensions.formautofill.available" = "off";
        "extensions.formautofill.creditCards.available" = lock-false;
        "extensions.formautofill.creditCards.enabled" = lock-false;
        "extensions.formautofill.heuristics.enabled" = lock-false;
        "app.normandy.enabled" = lock-false;
        "app.normandy.api_url" = "";
        "dom.webnotifications.enabled" = lock-false;
        "dom.webnotifications.serviceworker.enabled" = lock-false;
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
        # ! REMOVE TITLE BAR
        userChrome = ''
          /* hides the title bar */
          #titlebar {
            visibility: collapse;
          }

          #TabsToolbar-customization-target {
            visibility: collapse !important;
          } 

          /* hides the sidebar */
          #sidebar-header {
            visibility: collapse !important;
          } }
        '';
        search = {
          force = true; # avoid home-manager conflict
          default = "Google";
          privateDefault = "DuckDuckGo";
          order = [
            "Google"
            "Startpage"
            "NixOS Packages"
            "NixOS Options"
            "NixOS Wiki"
            "Home Manager Options"
            "Searx"
            "Kagi"
            "Ecosia"
            "Bing"
          ];
          engines = {
            "Startpage" = {
              urls = [
                {
                  template = "https://www.startpage.com/sp/search?query={searchTerms}&prfe=dea8b8a2e1126185da987128a196ee5c47cdf324dce146f96b3b9157ab1f9e7166ae05d134c935eccc20f54e46222c8f1bb60faece00557b02e7a4e1fe397bc0f6750fbd3f7f580b241188&abp=-1";
                }
              ];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@sp" ];
            };
            "Kagi" = {
              urls = [ { template = "https://kagi.com/search?q={searchTerms}"; } ];
              iconUpdateURL = "https://kagi.com/favicon.ico";
            };
            "Ecosia" = {
              urls = [ { template = "https://www.ecosia.org/search?method=index&q={searchTerms}"; } ];
              iconUpdateURL = "https://www.ecosia.org/favicon.ico";
            };
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              definedAliases = [ "@no" ];
            };
            "NixOS Wiki" = {
              urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
              iconUpdateURL = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "Home Manager Options" = {
              urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}"; } ];
              # urls = [
              #   {
              #     template = "https://mipmip.github.io/home-manager-option-search";
              #     params = [
              #       {
              #         name = "query";
              #         value = "{searchTerms}";
              #       }
              #     ];
              #   }
              # ];
              iconUpdateURL = "https://avatars.githubusercontent.com/u/33221035";
              updateInterval = 24 * 60 * 60 * 1000; # Update every day.
              definedAliases = [ "@hm" ];
            };
            "Searx" = {
              urls = [ { template = "https://searx.aicampground.com/?q={searchTerms}"; } ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@sx" ];
            };
            "Bing".metaData.hidden = true;
            # builtin engines only support specifying one additional alias
            "Google".metaData.alias = "@g";
          };
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
