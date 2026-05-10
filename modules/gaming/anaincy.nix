{ self, inputs, ... }: {
  flake.nixosModules.anaincy = { pkgs, config, ... }: {
    services = {
      ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-rules-cachyos;
      };
    };
  };
}
