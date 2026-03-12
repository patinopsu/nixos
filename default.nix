{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./modules/audio.nix
    ./modules/flatpak.nix
    ./modules/gui.nix
    ./modules/kernel.nix
    ./modules/misc.nix
    ./modules/networking.nix
    ./modules/nix.nix
    ./modules/packages.nix
    ./modules/power.nix
    ./modules/security.nix
    ./modules/theming.nix
    ./modules/virtualization.nix
    ./modules/users.nix

    # Variables
    ./modules/vars/default.nix

    # Optional Modules (NixOS Modules)
    ./modules/gaming/default.nix

    # Components Imports
    inputs.sops-nix.nixosModules.sops
    inputs.stylix.nixosModules.stylix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.home-manager.nixosModules.home-manager
  ];
}
