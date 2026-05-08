{ inputs, self, pkgs, ... }: {
  flake.nixosConfigurations.workstation = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      base
      audio
      flatpak
      desktop
      plasmade
      home-manager

      docker
      waydroid
      gaming
      vpn
      tailscale

      secureboot
      workstationcfg
      workstationhw
    ];
  };
  flake.nixosModules.workstationcfg = { pkgs, config, ... }: {
    networking = {
      hostName = "daytona";
    };
    hardware = {
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          libvdpau-va-gl
        ];
      };
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        nvidiaPersistenced = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
    };
    services = {
      xserver.videoDrivers = ["nvidia"];
    };
  };
}
