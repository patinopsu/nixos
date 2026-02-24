{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/DB14-0F2E";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/26504aba-e36f-426a-b3e7-36b6bfffa893";
    fsType = "ext4";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3f7e2e5c-d913-44dc-b66d-5740c14d57fc";
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

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/3f7e2e5c-d913-44dc-b66d-5740c14d57fc";
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

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/3f7e2e5c-d913-44dc-b66d-5740c14d57fc";
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

  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/3f7e2e5c-d913-44dc-b66d-5740c14d57fc";
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

  fileSystems."/mnt/volusia" = {
    device = "/dev/disk/by-uuid/63da539e-e0b5-448a-94bd-9c141d188b87";
    fsType = "btrfs";
    options = [
      "compress=zstd:1"
      "noatime"
      "ssd"
      "discard=async"
      "space_cache=v2"
      "nofail"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
