{ config, lib, pkgs, ... }:

{
  sops = {
    age.keyFile = "/etc/sops/age/keys.txt";
    secrets = {
      nextdns_id = {
        sopsFile = ../../src/sops/nextdns.yaml;
        restartUnits = [ "systemd-resolved.service" ];
      };
    };
  };
  sops.templates."nextdns.conf" = {
    mode = "0444";
    owner = "systemd-resolve";
    content = ''
      [Resolve]
      DNS=45.90.28.0#${config.sops.placeholder.nextdns_id}
      DNS=45.90.30.0#${config.sops.placeholder.nextdns_id} 
      DNS=2a07:a8c0::#${config.sops.placeholder.nextdns_id} 
      DNS=2a07:a8c1::#${config.sops.placeholder.nextdns_id}
      DNSOverTLS=yes
      Domains=~.
    '';
  };
  environment.etc."systemd/resolved.conf.d/nextdns.conf".source = config.sops.templates."nextdns.conf".path;
}