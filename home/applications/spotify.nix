{ inputs, self, ... }: {
  flake.homeModules.spotify = { config, lib, pkgs, ... }: {
    imports = [
      inputs.spicetify-nix.homeManagerModules.default
    ];
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      theme = spicePkgs.themes.text;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
    };
    stylix.targets.spicetify.enable = false;
  };
}
