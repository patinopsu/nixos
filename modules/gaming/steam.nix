{ self, inputs, ... }: {
  flake.nixosModules.steam = { pkgs, config, ... }: {
    imports = [
      inputs.nixos-millennium.nixosModules.default
    ];
    programs = {
      steam = {
        enable = true;
        gamescopeSession = {
          enable = true;
        };
        dedicatedServer.openFirewall = true;
      };
    };
    home-manager.users.${config.vars.username} = {
      imports = with self.homeModules; [
        steam
      ];
    };
  };
}
