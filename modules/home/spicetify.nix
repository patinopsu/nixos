{ config, lib, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in

{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.lucid;
     enabledExtensions = with spicePkgs.extensions; [
       adblockify
       hidePodcasts
       shuffle
       aiBandBlocker
     ];
  };
  stylix.targets.spicetify.enable = false;
}
