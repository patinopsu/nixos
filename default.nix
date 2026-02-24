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
    ./src/options.nix

    # Gaming Components
    ./modules/gaming/ananicy.nix
    ./modules/gaming/steam.nix

    # Components Imports
    inputs.sops-nix.nixosModules.sops
    inputs.stylix.nixosModules.stylix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.home-manager.nixosModules.home-manager
  ];
}
