{ inputs, self, ... }: {
  flake.homeModules.media = { config, lib, pkgs, ... }: {
    imports = [
      inputs.spicetify-nix.homeManagerModules.default
    ];
    programs = {
      mpv = {
        enable = true;
        config = {
          keepaspect-window = "yes";
          autofit = "50%x50%";
          hwdec = "auto-safe";
          ytdl-format = "bestvideo[height<=?1080]+bestaudio/best"; # Limit youtube-dl to 1080p
        };
      };
      spicetify = let
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
    };
    stylix.targets.spicetify.enable = false;
  };
}
