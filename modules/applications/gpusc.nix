{
  flake.nixosModules.gpusc = { lib, config, pkgs, ... }: {
    programs.gpu-screen-recorder.enable = true;
  };
}
