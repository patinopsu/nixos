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

      secureboot
      workstationcfg
      workstationhw
    ];
  };
  flake.nixosModules.workstationcfg = { stdenv, pkgs, config, ... }: {
    vars = {
      prettyname = "Workstaion";
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
      udev.extraRules = ''
        # Ajazz AKP153 Rev2 - USB and HIDRAW access
        SUBSYSTEM=="usb", ATTRS{idVendor}=="0300", ATTRS{idProduct}=="3010", GROUP="input", MODE="0660"
        KERNEL=="hidraw*", ATTRS{idVendor}=="0300", ATTRS{idProduct}=="3010", GROUP="input", MODE="0660"

        KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
      '';
    };
    users.users.${config.vars.username}.extraGroups = [ "input" ];
    environment.systemPackages = [
      pkgs.nodejs
      pkgs.wineWow64Packages.waylandFull
      pkgs.nvtopPackages.nvidia
      inputs.opendeck-nix.packages.${pkgs.stdenv.hostPlatform.system}.opendeck
    ];
    environment.variables = {
      MOZ_DISABLE_RDD_SANDBOX = "1";
    };
  };
}
