{ inputs, self, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    networking = {
      networkmanager = {
        dns = "systemd-resolved";
      };
    };
    sops = {
      secrets."nextdns" = {
        sopsFile = "${config.vars.configsrc}/secrets/common/nextdns.yaml";
        key = "id";
      };
      templates."nextdns-resolved.conf" = {
        mode = "0440";
        owner = "systemd-resolve";
        group = "systemd-resolve";
        path = "/etc/systemd/resolved.conf.d/nextdns.conf";
        content = ''
          [Resolve]
          DNSOverTLS=yes
          DNS=45.90.28.0#${config.vars.nextdns_hostname}-${config.sops.placeholder.nextdns}.dns.nextdns.io
          DNS=45.90.30.0#${config.vars.nextdns_hostname}-${config.sops.placeholder.nextdns}.dns.nextdns.io
          Domains=~.
        '';
      };
    };
    services = {
      resolved = {
        enable = true;
        settings.Resolve = {
          DNSSEC = true;
        };
      };
    };
  };
}
