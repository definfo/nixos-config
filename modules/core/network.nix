{ pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      unmanaged = [
        "*"
        "except:type:wwan"
        "except:type:gsm"
      ];
    };
    # Use wpa_supplicant to manage WLAN
    wireless = {
      enable = true;
      networks."SJTU" = {
        # TODO: manually fill in jaccount_{id,password} below
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          identity="jaccount_id"
          password="jaccount_password"
          # NixOS is compatible with both cert paths below
          ca_cert="/etc/ssl/certs/ca-certificates.crt"  # debian/ubuntu
          #  ca_cert="/etc/pki/tls/certs/ca-bundle.crt"  # redhat/centos/fedora
          phase1="peaplabel=0"
          phase2="auth=MSCHAPV2"
          # subject_match="/CN=radius.net.sjtu.edu.cn"
          altsubject_match="DNS:radius.net.sjtu.edu.cn"
          # domain_match="radius.net.sjtu.edu.cn" # require wpa_supplicant v2.4
        '';
      };
      extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
    };
    # nameservers = [ "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
      # allowedUDPPortRanges = [
      # { from = 4000; to = 4007; }
      # { from = 8000; to = 8010; }
      # ];
    };
  };

  # Workaround of SJTU WLAN incompatibility with Safe TLS Renegotiation
  # https://github.com/NixOS/nixpkgs/issues/193646#issuecomment-1265284955
  systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText "openssl.cnf" ''
    openssl_conf = openssl_init
    [openssl_init]
    ssl_conf = ssl_sect
    [ssl_sect]
    system_default = system_default_sect
    [system_default_sect]
    Options = UnsafeLegacyRenegotiation
  '';

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
