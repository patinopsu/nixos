{ inputs, self, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: let
    nextdnsHost = "dns.nextdns.io";
  in {
    networking = {
      networkmanager = {
        dns = "systemd-resolved";
      };
    };
    services = {
      resolved = {
        enable = true;
        settings.Resolve = {
          DNSOverTLS = true;
          DNSSEC = true;
          DNS = ''
            45.90.28.0#${nextdnsHost}
            45.90.30.0#${nextdnsHost}
            2a07:a8c0::#${nextdnsHost}
            2a07:a8c1::#${nextdnsHost}
            Domains=~.
          '';
        };
      };
    };
  };
}
