{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, config, ... }: {
    programs = {
      steam = {
        enable = true;
        dedicatedServer.openFirewall = true;
      };
    };
  };
}
