{ ... }:
{
  # fcitx5-rime config
  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: "rime_ice"
  '';
}
