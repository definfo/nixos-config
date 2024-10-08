{
  pkgs,
  pkgs-stable,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        pkgs-stable
        ;
    };
    users.${username} = {
      imports = if (host == "desktop") then [ ./../home/default.desktop.nix ] else [ ./../home ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPassword = "PASSWORD"; # TODO: set password by `mkpasswd`
    openssh.authorizedKeys.keys = [ ];
    shell = pkgs.zsh;
  };
  nix.settings = {
    allowed-users = [ "${username}" ];
    trusted-users = [
      "root"
      "@wheel"
    ];
  };
}
