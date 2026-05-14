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
    fileSystems = let
      BOOTUUID = "6572-9F54";
      ROOTUUID = "31543045-fba5-4482-9b2a-73493e864a44";
      BXUUID = "b0689c57-359a-479c-b8e8-0da5ffd36f53";
    in {
      "/boot" = {
        device = "/dev/disk/by-uuid/${BOOTUUID}";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };
      "/" = {
        device = "/dev/disk/by-uuid/${ROOTUUID}";
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
        device = "/dev/disk/by-uuid/${ROOTUUID}";
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
        device = "/dev/disk/by-uuid/${ROOTUUID}";
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
        device = "/dev/disk/by-uuid/${ROOTUUID}";
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
      "/mnt/clayton" = {
        device = "/dev/disk/by-uuid/${BXUUID}";
        fsType = "ext4";
        options = [
          "nofail"
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
