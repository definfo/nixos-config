{
  pkgs,
  inputs,
  ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://definfo.cachix.org"
        "https://attic.xuyh0120.win/lantian"
        "https://linyinfeng.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "definfo.cachix.org-1:3xEHcK5UZeKih42Oiuo7ypfw4i0ghc9pO9DZf3M8iaY="
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        "linyinfeng.cachix.org-1:sPYQXcNrnCf7Vr7T0YmjXz5dMZ7aOKG3EqLja0xr9MM="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlay
      inputs.rust-overlay.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
