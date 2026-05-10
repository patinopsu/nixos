{ inputs, self, ... }: {
  flake.nixosModules.docker = { config, lib, pkgs, ... }: {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
    users.users.${config.vars.username}.extraGroups = [ "podman" ];
    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };
}
