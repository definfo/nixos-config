{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ]; # services.pipewire.lowLatency

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
    lowLatency.enable = true;
  };
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
