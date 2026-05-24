{ inputs, self, ... }: {
  flake.nixosModules.docker = { config, lib, pkgs, ... }: {
    virtualisation = {
      docker = {
        enable = true;
        storageDriver = "btrfs";
      };
      podman = {
        enable = true;
      };
    };
    users.users.${config.vars.username}.extraGroups = [
      "docker"
      "podman"
    ];
  };
}
