{
  config,
  username,
  pkgs,
  ...
}:
{
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  # `exclusive_caps=1` is necessary for some Chromium/WebRTC based application
  # `video_nr=9` may not be recognized by wemeet, use `devices=1` as workaround
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 card_label=Video-Loopback exclusive_caps=1
  '';
  users.users.${username}.extraGroups = [ "video" ];
  environment.systemPackages = [
    pkgs.v4l-utils
    config.boot.kernelPackages.v4l2loopback.bin
  ];
}
