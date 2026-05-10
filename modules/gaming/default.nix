{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.anaincy
      self.nixosModules.steam
    ];
    home-manager.users.${config.vars.username} = {
      imports = with self.homeModules; [
        mangohud
      ];
    };
  };
}
