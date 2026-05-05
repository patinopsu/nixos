{ inputs, self, ... }: {
  flake.nixosModules.t14gen1hw = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
    boot = {
      initrd = {
        kernelModules = [
          "dm-snapshot"
        ];
        availableKernelModules = [
          "tpm_tis"
          "xhci_pci"
          "nvme"
          "usbhid"
          "usb_storage"
          "rtsx_pci_sdmmc"
          "sd_mod"
        ];
        luks = {
          devices = {
            "cryptlvm" = {
              device = "/dev/disk/by-uuid/3db64b5d-06c6-4a8d-8a12-89f385346c1a";
              preLVM = true;
              allowDiscards = true;
            };
          };
        };
      };
      kernelModules = [
        "kvm-intel"
      ];
    };
    fileSystems = {
      "/boot" = {
        device = "/dev/disk/by-uuid/F4B1-F4AE";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };
      "/" = {
        device = "/dev/mapper/vg0-root";
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
        device = "/dev/mapper/vg0-root";
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
        device = "/dev/mapper/vg0-root";
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
        device = "/dev/mapper/vg0-root";
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
      "/mnt/d" = {
        device = "/dev/mapper/vg0-data";
        fsType = "btrfs";
        options = [
          "compress=zstd"
          "noatime"
          "x-gvfs-show"
          "discard=async"
          "ssd"
          "space_cache=v2"
        ];
      };
    };
    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 32*1024;
    }];
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
