{ inputs, self, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    networking = {
      networkmanager = {
        dns = "none";
        appendNameservers = [
          "127.0.0.53"
        ];
      };
    };
    sops = {
      secrets."nextdns" = {
        sopsFile = "${config.vars.configsrc}/secrets/common/nextdns.yaml";
        key = "id";
      };
      templates."dnsproxy.yaml" = {
        group = "keys";
        mode = "0440";
        path = "/run/dnsproxy.yaml";
        content = ''
          listen-addrs:
            - 127.0.0.53
          listen-ports:
            - 53
          upstream:
            - https://dns.nextdns.io/${config.sops.placeholder.nextdns}/${config.vars.prettyname}
          bootstrap:
            - 9.9.9.9
            - 1.1.1.1
        '';
      };
    };
    services = {
      dnsproxy = {
        enable = true;
        flags = [ "--config-path=${config.sops.templates."dnsproxy.yaml".path}" ];
      };
      resolved.enable = false;
    };
    systemd.services.dnsproxy.serviceConfig = {
      SupplementaryGroups = [ "keys" ];
      BindReadOnlyPaths = [
        "/run/secrets/rendered"
        "${config.sops.templates."dnsproxy.yaml".path}"
      ];
    };
  };
}
