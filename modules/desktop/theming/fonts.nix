{ self, inputs, ...}: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
    };
  };
}
