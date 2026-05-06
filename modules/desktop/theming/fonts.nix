{ self, inputs, ...}: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      fontconfig = {
        enable = true;
        subpixel.rgba = "rgb";  # This forces RGB, not BGR
      };
    };
  };
}
