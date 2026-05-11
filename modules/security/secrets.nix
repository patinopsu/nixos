{ inputs, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
    #sops = {
    #  defaultSopsFile = ../../secrets/global.yaml;
    #};
    environment.systemPackages = with pkgs; [
      sops
    ];
  };
}
