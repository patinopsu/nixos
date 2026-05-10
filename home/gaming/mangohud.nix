{ self, inputs, ... }: {
  flake.homeModules.mangohud = { pkgs, config, ... }: {
    programs.mangohud = {
      enable = true;
      enableSessionWide = false;
    };
  };
}
