{ config, lib, pkgs, ... }:

{
  networking.hostName = "bellevue";
  home-manager.users.${config.vars.username}.programs.zsh.shellAliases = { nrb = "sudo nixos-rebuild switch --flake ~/nixos#t14gen1 --impure"; };

  vars.efiuuid = "3FD8-A235";
  vars.bootuuid = "1e7b7029-fe58-4171-8c6d-f9c4e6aedc78";
  vars.rootuuid = "2eebacb3-7e4c-448d-9147-b66a9b5c3b28";

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };2
}
