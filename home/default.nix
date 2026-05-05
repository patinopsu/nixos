{ self, inputs, ... }: {
  flake.nixosModules.home-manager = { config, pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      users.${config.vars.username} = {
        imports = with self.homeModules; [
          base
          cli
          git
          ssh
        ];
      };
    };
  };
}
