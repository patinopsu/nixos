{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    networking = {
      hostName = lib.mkDefault "undefined";
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
