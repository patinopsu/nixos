{ inputs, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
    sops = {
      age.keyFile = "${config.home-manager.users.${config.vars.username}.home.homeDirectory}/.config/sops/age/keys.txt";
    };
    environment.systemPackages = with pkgs; [
      sops
    ];
  };
}
