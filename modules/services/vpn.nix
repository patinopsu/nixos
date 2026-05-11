{
  flake.nixosModules.vpn = { config, pkgs, ... }: {
    services = {
      tailscale = {
        enable = true;
      };
    };
    networking = {
      networkmanager = {
        unmanaged = [
          "tailscale0"
        ];
      };
      firewall = {
        trustedInterfaces = [ "tailscale0" ];
        allowedUDPPorts = [ config.services.tailscale.port ];
      };
    };
    systemd.services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];
  };
}
