{ inputs, ... }: {
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
    sops = {
      age.keyFile = "/etc/age-key.txt";
    };
    environment.systemPackages = with pkgs; [
      sops
    ];
  };
}
