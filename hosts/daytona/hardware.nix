{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      kernelModules = [];
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
    };
    extraModulePackages = [];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/${config.globalvars.bootuuid}";
      fsType = "ext4";
    };
    "/boot/efi" = {
      device = "/dev/disk/by-uuid/${config.globalvars.efiuuid}";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
    "/" = {
      device = "/dev/disk/by-uuid/${config.globalvars.rootuuid}";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd:1"
        "noatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
      ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/${config.globalvars.rootuuid}";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd:1"
        "noatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
      ];
    };
    "/swap" = { 
      device = "/dev/disk/by-uuid/${config.globalvars.rootuuid}";
      fsType = "btrfs";
      options = [
        "subvol=@swap"
        "compress=zstd:1"
        "noatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
      ];
    };
    "/nix" = { 
      device = "/dev/disk/by-uuid/${config.globalvars.rootuuid}";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd:1"
        "noatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
      ];
    };
    "/var/log" = {
      device = "/dev/disk/by-uuid/${config.globalvars.rootuuid}";
      fsType = "btrfs";
      options = [
        "subvol=@log"
        "compress=zstd:1"
        "noatime"
        "ssd"
        "discard=async"
        "space_cache=v2"
      ];
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 32*1024;
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
