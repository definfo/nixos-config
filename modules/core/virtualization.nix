{
  config,
  pkgs,
  username,
  ...
}:
{
  # Add user to libvirtd/podman group
  users.users.${username}.extraGroups = [
    "libvirtd"
    "podman"
  ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme

    # Useful devtools
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    docker-compose # start group of containers for dev
    # podman-compose # (experimental) start group of containers for dev
    distrobox # run different distros inside container

    arion
    # Do install the docker CLI to talk to podman.
    # Not needed when virtualisation.docker.enable = true;
    docker-client
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;

    containers.enable = true; # Enable common container config files in /etc/containers
    docker.enable = false; # Conflict with podman
    podman = {
      enable = true;

      # Make the Podman socket available in place of the Docker socket, so Docker tools can find the Podman socket.
      # Podman implements the Docker API.
      # Users must be in the podman group in order to connect.
      dockerSocket.enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  services.spice-vdagentd.enable = true;

  # Enable flatpak sandbox
  services.flatpak.enable = true;
}
