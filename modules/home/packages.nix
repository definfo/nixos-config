{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    # audacity # audio editor
    bitwise # cli tool for bit / hex manipulation
    cbonsai # terminal screensaver
    evince # gnome pdf viewer
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    file # Show file information
    # fzf # fuzzy finder
    gtt # google translate TUI
    gifsicle # gif utility
    gimp
    gtrash # rm replacement, put deleted files in system trash
    hexdump
    libreoffice
    nautilus # file manager
    nitch # systhem fetch util
    nix-prefetch-github
    nix-output-monitor
    nixpkgs-fmt
    nil
    nixfmt-rfc-style
    # nixd
    pipes # terminal screensaver
    # prismlauncher # minecraft launcher
    ripgrep # grep replacement
    # soundwireserver                   # pass audio to android phone
    tdf # cli pdf viewer
    todo # cli todo list
    toipe # typing test in the terminal
    valgrind # c memory analyzer
    yazi # terminal file manager
    yt-dlp
    zenity

    # C / C++
    gnumake
    jetbrains.clion # Unfree

    # Java
    jdk17
    # jetbrains.idea-community-bin
    # jetbrains.idea-ultimate # Unfree
    # github-copilot-intellij-agent

    # Python
    python3
    # jetbrains.pycharm-community-bin
    # jetbrains.pycharm-professional # Unfree

    # Rust
    rustc
    cargo
    crate2nix
    # zed-editor

    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    ffmpeg
    imv # image viewer
    killall
    libnotify
    man-pages # extra man pages
    ncdu # disk space
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist # clipboard manager
    poweralertd
    qalculate-gtk # calculator
    unzip
    wget
    xdg-utils
    xxd
    inputs.alejandra.defaultPackage.${system}

    nur.repos.definfo.lyricer
  ];
}
