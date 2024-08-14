{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    package =
      (pkgs.vscode.override {
        isInsiders = true;
        # https://wiki.archlinux.org/title/Wayland#Electron
        commandLineArgs = [
          "--ozone-platform-hint=auto"
          "--ozone-platform=wayland"
          # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
          # (only supported by chromium/chrome at this time, not electron)
          "--gtk-version=4"
          # make it use text-input-v1, which works for kwin 5.27 and weston
          "--enable-wayland-ime"

          # TODO: fix https://github.com/microsoft/vscode/issues/187436
          # still not works...
          "--password-store=gnome" # use gnome-keyring as password store
        ];
      }).overrideAttrs
        (oldAttrs: rec {
          # Use VSCode Insiders to fix crash: https://github.com/NixOS/nixpkgs/issues/246509
          src = builtins.fetchTarball {
            url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
            # TODO: manually fill in sha256 if mismatch
            sha256 = "1xr3byinhdh2hvpw6w7z7if7p3a3zknl58y9qawh4p2cmi30l2n9";
          };
          version = "latest";
        });

    userSettings = { };

    # package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # Nix language
      bbenoist.nix

      # Nix-shell suport
      arrterian.nix-env-selector

      # Direnv
      mkhl.direnv

      # Python
      ms-python.python
      ms-python.vscode-pylance # lsp
      ms-python.debugpy # debugger
      ms-python.black-formatter # formatter
      # matangover.mypy # linter

      # C/C++
      ms-vscode.cpptools

      # OCaml
      # ocamllabs.ocaml-platform

      # Coq
      # maximedenes.vscoq # requires coqPackages.vscoq-language-server
      # or manually install ejgallego.coq-lsp with coqPackages.coq-lsp

      # Jupyter
      ms-toolsai.jupyter

      # GNU-make/CMake
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools

      # Comments
      aaron-bond.better-comments

      # Neovim
      asvetliakov.vscode-neovim

      # Wakatime
      wakatime.vscode-wakatime

      # Github
      # github.copilot
      # github.copilot-chat

      # Color theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      # i18n
      ms-ceintl.vscode-language-pack-zh-hans
    ];
    # ! ONLY FOR REFERENCE, DO NOT UNCOMMENT
    # Use Accounts - Settings Sync to save settings
    # userSettings = {
    # "update.mode" = "none";
    # "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
    # "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
    #
    # "window.menuBarVisibility" = "toggle";
    # "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
    # "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
    # "editor.fontSize" = 16;
    # "workbench.colorTheme" = "Catppuccin Mocha";
    # "workbench.iconTheme" = "catppuccin-mocha";
    # "catppuccin.accentColor" = "lavender";
    # "vsicons.dontShowNewVersionMessage" = true;
    # "explorer.confirmDragAndDrop" = false;
    # "editor.fontLigatures" = true;
    # "editor.minimap.enabled" = false;
    # "workbench.startupEditor" = "none";
    #
    # "editor.formatOnSave" = true;
    # "editor.formatOnType" = true;
    # "editor.formatOnPaste" = true;
    #
    # "workbench.layoutControl.type" = "menu";
    # "workbench.editor.limit.enabled" = true;
    # "workbench.editor.limit.value" = 10;
    # "workbench.editor.limit.perEditorGroup" = true;
    # "workbench.editor.showTabs" = "multiple";
    # "files.autoSave" = "afterDelay";
    # "explorer.openEditors.visible" = 0;
    # "breadcrumbs.enabled" = false;
    # "editor.renderControlCharacters" = false;
    # "workbench.activityBar.location" = "default";
    # "workbench.statusBar.visible" = true;
    # "editor.scrollbar.verticalScrollbarSize" = 2;
    # "editor.scrollbar.horizontalScrollbarSize" = 2;
    # "editor.scrollbar.vertical" = "hidden";
    # "editor.scrollbar.horizontal" = "hidden";
    # "workbench.layoutControl.enabled" = false;
    #
    # "editor.mouseWheelZoom" = true;
    #
    # "vscode-neovim.useCtrlKeysForInsertMode" = "false";
    # "extensions.experimental.affinity" = {
    # "asvetliakov.vscode-neovim" = 1;
    # };
    # "direnv.restart.automatic" = true;
    # };
    # Keybindings
    # keybindings = [
    # ];
  };
}
