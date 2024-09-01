{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixos-hardware.url = "github:definfo/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };

    grub2-themes.url = "github:vinceliuice/grub2-themes";

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      username = "USERNAME"; # TODO: set username
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ (import ./hosts/desktop) ];
          specialArgs = {
            host = "desktop";
            inherit
              self
              inputs
              username
              pkgs-stable
              ;
          };
        };
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (import ./hosts/laptop)
          ];
          specialArgs = {
            host = "laptop";
            inherit
              self
              inputs
              username
              pkgs-stable
              ;
          };
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ (import ./hosts/vm) ];
          specialArgs = {
            host = "vm";
            inherit
              self
              inputs
              username
              pkgs-stable
              ;
          };
        };
      };
    };
}
