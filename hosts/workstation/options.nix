{ config, lib, pkgs, ... }:

{
  networking.hostName = "daytona";
  home-manager.users.${config.vars.username}.programs.zsh.shellAliases = { nrb = "sudo nixos-rebuild switch --flake ~/nixos#workstation --impure"; };

  vars.efiuuid = "3FD8-A235";
  vars.bootuuid = "1e7b7029-fe58-4171-8c6d-f9c4e6aedc78";
  vars.rootuuid = "2eebacb3-7e4c-448d-9147-b66a9b5c3b28";

  steam.enable = true;
  ananicy-cpp.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
  fileSystems."/mnt/volusia" = {
    device = "/dev/disk/by-uuid/1a486610-4865-491b-94c8-a95de6bdbb88";
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
}
