{ inputs, self, ... }: {
  flake.nixosModules.secureboot = { config, lib, pkgs, ... }: {
    boot.loader.limine.secureBoot = {
      enable = true;
      autoGenerateKeys = true;
      autoEnrollKeys.enable = true;
    };
    environment.systemPackages = with pkgs; [
      sbctl
    ];
  };
}
