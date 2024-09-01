{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # jack.enable = true;
    lowLatency.enable = true;
    # Uncomment if encounter sound glitches
    # extraConfig.pipewire = {
    # "10-clock-rate" = {
    # "context.properties" = {
    # "default.clock.rate" = 48000;
    # "default.clock.allowed-rates" = [48000];
    # "default.clock.quantum" = 2048;
    # "clock.min-quantum" = 1024;
    # "clock.max-quantum" = 8192;
    # "clock.quantum-limit" = 8192;
    # };
    # };
    # };
  };
  # boot.extraModprobeConfig = ''
  #   options snd slots=snd-hda-intel
  # '';
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
