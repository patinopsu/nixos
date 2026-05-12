{ inputs, ... }: {
  flake.nixosModules.gpusc = { lib, config, pkgs, ... }: {
    imports = [
      inputs.gsr-ui-nix.nixosModules.default
    ];
    programs.gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };
  };
}
