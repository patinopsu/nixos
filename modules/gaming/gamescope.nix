{ self, inputs, ... }: {
  flake.nixosModules.gamescope = { pkgs, config, ... }: {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
