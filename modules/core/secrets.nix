{ inputs, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
