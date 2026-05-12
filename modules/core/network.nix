{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    networking = {
      hostName = config.vars.codename;
      networkmanager = {
        enable = true;
      };
      firewall = {
        enable = true;
        backend = "nftables";
      };
      nftables = {
        enable = true;
      };
    };
  };
}
