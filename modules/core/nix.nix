{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
        ];
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
      optimise = {
        automatic = true;
        dates = [ "03:45" ];
      };
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };
    system.stateVersion = "25.11";
  };
}
