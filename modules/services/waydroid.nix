{
  flake.nixosModules.waydroid = { config, lib, pkgs, ... }: {
    virtualisation.waydroid = {
      enable = true;
      package = pkgs.waydroid-nftables;
    };
    networking = {
      firewall.trustedInterfaces = [
        "waydroid0"
      ];
    };
    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv4.conf.all.forwarding" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };
  };
}
