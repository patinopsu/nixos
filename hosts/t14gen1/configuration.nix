{ inputs, self, pkgs, ... }: {
  flake.nixosConfigurations.t14gen1 = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      base
      audio
      bluetooth
      flatpak
      desktop
      wmniri
      home-manager
      secureboot
      docker
      vpn

      t14gen1cfg
      t14gen1hw
      t14gen1lte
    ];
  };
  flake.nixosModules.t14gen1cfg = { config, lib, pkgs, ... }: {
    imports = with inputs; [
      nixos-hardware.nixosModules.lenovo-thinkpad-t14-intel-gen1
    ];
    networking = {
      hostName = "atlanta";
    };
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
      ];
    };
    services = {
      throttled.enable = true;
    };
    services.displayManager.ly.settings = {
      box_title = "Patin's ThinkPad T14 Gen 1";
      battery_id = "BAT0";
    };
    environment.systemPackages = with pkgs; [
      tpm2-tss
      tpm2-tools
    ];
    home-manager.users.${config.vars.username}.programs.niri.settings = {
      input = {
        touchpad = {
          enable = false;
        };
        trackpoint = {
          accel-speed = 0.38;
          accel-profile = "flat";
        };
        mouse = {
          accel-speed = -0.38;
        };
      };
      outputs = {
        "eDP-1" = {
          enable = true;
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
        };
      };
    };
  };
}
