{
  flake.nixosModules.base = { config, lib, pkgs, ... }: {
    boot = {
      loader = {
        limine = {
          enable = true;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
      plymouth = {
        enable = true;
      };
      initrd = {
        systemd = {
          enable = true;
          tpm2.enable = true;
        };
      };
    };
  };
}
