{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
    };
    hardware = {
      enableAllFirmware = true;
    };
    environment.systemPackages = with pkgs; [
      e2fsprogs
    ];
  };
}
