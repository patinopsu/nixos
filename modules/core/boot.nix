{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    boot = {
      loader = {
        limine = {
          enable = true;
          style = {
            wallpapers = [
             "${config.vars.configsrc}/assets/wallpapers/Cotton Candy Skies 1.png"
            ];
          };
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
      plymouth = {
        enable = true;
      };
      consoleLogLevel = 3;
      kernelParams = [
        "quiet"
        "udev.log_level=3"
        "systemd.show_status=auto"
      ];
      initrd = {
        systemd = {
          enable = true;
          tpm2.enable = true;
        };
        verbose = false;
      };
    };
  };
}
