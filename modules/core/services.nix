{ ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };
  services.logind.extraConfig = ''
    # don't shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  # Enable Open-webui
  # services.open-webui = {
  # enable = true;
  # environment = {
  # # Default
  # ANONYMIZED_TELEMETRY = "False";
  # DO_NOT_TRACK = "True";
  # SCARF_NO_ANALYTICS = "True";
  #
  # OPENAI_API_KEY = "openai_api_key";
  # OPENAI_API_BASE_URL = "openai_proxy_url/v1"; # optional
  # TASK_MODEL_EXTERNAL = "model_name";
  # };
  # # host openFirewall package port stateDir
  # };
}
