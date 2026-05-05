{ self, inputs, ...}: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      packages = with pkgs; [
        inter
        nerd-fonts.jetbrains-mono
      ];
    };
  };
}
