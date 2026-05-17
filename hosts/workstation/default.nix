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
      gpusc
      opendeck

      secureboot
      workstationcfg
      workstationhw
    ];
  };
  flake.nixosModules.workstationcfg = { stdenv, pkgs, config, ... }: {
    vars = {
      prettyname = "Workstation";
      codename = "daytona";
      nextdns_hostname = config.vars.prettyname;
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
      nvidia-container-toolkit.enable = true;
    };
    services = {
      xserver.videoDrivers = ["nvidia"];
    };
    users.users.${config.vars.username}.extraGroups = [ "input" ];
    environment.systemPackages = [
      pkgs.nvtopPackages.nvidia
    ];
    environment.variables = {
      MOZ_DISABLE_RDD_SANDBOX = "1";
    };
  };
}
