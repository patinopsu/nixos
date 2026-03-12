{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./nvidia.nix
    ./options.nix
  ];
}
