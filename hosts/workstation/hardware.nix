{
  flake.nixosModules.workstationhw = { config, lib, pkgs, modulesPath, ... }: {
    boot = {
      kernel.sysctl = {
        "vm.swappiness" = 10;
      };
      kernelParams = [
        "zswap.enabled=1"
      ];
      initrd = {
        availableKernelModules = [
          "xhci_pci"
          "ahci"
          "nvme"
          "usbhid"
          "sd_mod"
        ];
        kernelModules = [];
      };
      kernelModules = [ "kvm-intel" ];
      extraModulePackages = [ ];
    };
    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-uuid/6572-9F54";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };
      "/" = {
        device = "/dev/disk/by-uuid/31543045-fba5-4482-9b2a-73493e864a44";
        fsType = "btrfs";
        options = [
          "subvol=@"
          "compress=zstd"
          "noatime"
          "discard=async"
          "ssd"
          "space_cache=v2"
        ];
      };
      "/home" = {
        device = "/dev/disk/by-uuid/31543045-fba5-4482-9b2a-73493e864a44";
        fsType = "btrfs";
        options = [
          "subvol=@home"
          "compress=zstd"
          "noatime"
          "discard=async"
          "ssd"
          "space_cache=v2"
        ];
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/31543045-fba5-4482-9b2a-73493e864a44";
        fsType = "btrfs";
        options = [
          "subvol=@nix"
          "compress=zstd"
          "noatime"
          "discard=async"
          "ssd"
          "space_cache=v2"
        ];
      };
      "/var/log" = {
        device = "/dev/disk/by-uuid/31543045-fba5-4482-9b2a-73493e864a44";
        fsType = "btrfs";
        options = [
          "subvol=@log"
          "compress=zstd"
          "noatime"
          "discard=async"
          "ssd"
          "space_cache=v2"
        ];
      };
    };

    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 32*1024;
      }
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
