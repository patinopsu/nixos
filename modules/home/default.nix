{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./browsers.nix
    ./extra.nix
    ./fastfetch.nix
    ./git.nix
    ./hmcfg.nix
    ./kitty.nix
    ./packages.nix
    ./plasma.nix
    ./spicetify.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix

    # Variables
    ../../src/options.nix
    
    inputs.spicetify-nix.homeManagerModules.spicetify
    inputs.plasma-manager.homeModules.plasma-manager
  ];
}
