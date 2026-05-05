{ inputs, self, ... }: {
  flake.nixosModules.docker = { config, lib, pkgs, ... }: {
    virtualisation = {
      docker = {
        enable = true;
        storageDriver = "btrfs";
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
    };
    users.users.${config.vars.username}.extraGroups = [ "docker" ];
  };
}
