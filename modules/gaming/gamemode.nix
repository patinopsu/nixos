{ self, inputs, ... }: {
  flake.nixosModules.gamemode = { pkgs, config, ... }: {
    programs.gamemode = {
      enable = true;
      enableRenice = true;
    };
  };
}
