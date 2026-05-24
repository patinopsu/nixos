{
  flake.nixosModules.vpn = { config, pkgs, ... }: {
    services = {
      tailscale = {
        enable = true;
        extraUpFlags = [
          "--ssh"
          "--accept-dns=false"
          "--accept-routes=true"
        ];
      };
    };
    networking = {
      networkmanager = {
        unmanaged = [
          "tailscale0"
        ];
        appendNameservers = [
          "100.100.100.100"
        ];
      };
      firewall = {
        trustedInterfaces = [
          "tailscale0"
        ];
        allowedUDPPorts = [ config.services.tailscale.port ];
      };
    };
    systemd.services.tailscaled.serviceConfig = {
      Environment = [
        "TS_DEBUG_FIREWALL_MODE=nftables"
      ];
      RuntimeDirectoryMode = "0755";
    };
  };
}
