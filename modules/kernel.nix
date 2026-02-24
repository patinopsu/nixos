{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;

  hardware.i2c.enable = true;
  hardware.intel-gpu-tools.enable = true;
  hardware.uinput.enable = true;

  zramSwap.enable = true;
  zramSwap.priority = 100;
  zramSwap.algorithm = "zstd";
}
