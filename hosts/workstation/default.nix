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

      nvidia
      secureboot
      workstationcfg
      workstationhw
    ];
  };
  flake.nixosModules.workstationcfg = { stdenv, pkgs, config, ... }: {
    vars = {
      prettyname = "Workstation";
      codename = "daytona";
    };
    hardware = {
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          libvdpau-va-gl
        ];
      };
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
