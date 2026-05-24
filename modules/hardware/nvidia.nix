{ inputs, self, ... }: {
  flake.nixosModules.nvidia = { config, lib, pkgs, ... }: {
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        nvidiaPersistenced = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
      nvidia-container-toolkit.enable = true;
    };
    virtualisation.docker = {
      daemon.settings = {
        features.cdi = true;
      };
    };
  };
}
