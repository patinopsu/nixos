{
  flake.nixosModules.bluetooth = { config, lib, pkgs, ... }: {
    hardware.bluetooth = {
      enable = true;
    };
  };
}
