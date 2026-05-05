{ inputs, self, pkgs, ... }: {
  flake.nixosConfigurations.workstation = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      base
      audio
      flatpak
      desktop
      niriwm
      home-manager

      docker
      vpn

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
      throttled.enable = true;
      xserver.videoDrivers = ["nvidia"];
    };
    services.displayManager.ly.settings = {
      box_title = "Patin's Workstation";
    };
    home-manager.users.${config.vars.username}.programs.niri.settings = {
      input = {
        mouse = {
          accel-speed = -0.10;
        };
      };
      outputs = {
        "DP-2" = {
          variable-refresh-rate = "on-demand";
          mode = {
            width = 1920;
            height = 1080;
            refresh = 144.0;
          };
        };
      };
    };
  };
}
