{ host, ... }:
let
  shellAliases = {
    # TODO: modify audio device according to [pactl list sources | rg alsa.output | rg Name]
    # Conflict with scripts/record.sh
    # record = "wf-recorder --audio=alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";

    # Utils
    c = "clear";
    cd = "z";
    ls = "eza";
    tt = "gtrash put";
    cat = "bat";
    nano = "micro";
    code = "code-insiders"; # TODO: set with respect to code instance
    py = "python";
    icat = "kitten icat";
    dsize = "du -hs";
    # findw = "grep -rl"; # replaced by ripgrep
    findw = "rg -l";
    pdf = "tdf";
    open = "xdg-open";
    zj = "zellij";

    l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
    ll = "eza --icons  -a --group-directories-first -1 --long";
    tree = "eza --icons --tree --group-directories-first";

    # Nixos
    cdnix = "cd ~/nixos-config && code ~/nixos-config";
    ns = "nix-shell --run zsh";
    nix-shell = "nix-shell --run zsh";
    nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#${host}";
    nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#${host}";
    nix-flake-update = "sudo nix flake update ~/nixos-config#";
    nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";

    # Git
    ga = "git add";
    gre = "git restore";
    grea = "git restore --all";
    gaa = "git add --all";
    gs = "git status";
    gb = "git branch";
    gm = "git merge";
    gpl = "git pull";
    gplo = "git pull origin";
    gps = "git push";
    gpst = "git push --follow-tags";
    gpso = "git push origin";
    gc = "git commit";
    gcm = "git commit -m";
    gcma = "git add --all && git commit -m";
    gtag = "git tag -ma";
    gch = "git checkout";
    gchb = "git checkout -b";
    gcoe = "git config user.email";
    gcon = "git config user.name";

    # python
    piv = "python -m venv .venv";
    psv = "source .venv/bin/activate";

    # (experimental) im
    qq = "hyprctl dispatch exec '[workspace 4] qq --enable-features=UseOzonePlatform --ozone-platform-hint=auto --enable-wayland-ime'";
    wechat = "hyprctl dispatch exec '[workspace 4] QT_IM_MODULE=fcitx flatpak run com.tencent.WeChat'";
  };
in
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;
    profileExtra = ''
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    '';
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
    '';
    inherit shellAliases;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    # keyMode = "vi";
    mouse = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    tmux = {
      enableShellIntegration = true;
      # shellIntegrationOptions = {};
    };
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };
}