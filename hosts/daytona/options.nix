{ config, lib, pkgs, ... }:

{
  networking.hostName = "daytona";
  #networking.firewall.allowedTCPPorts = [ 4455 8084 4653 ];
  #networking.firewall.allowedUDPPorts = [ 4455 8084 4653 ];
  home-manager.users.${config.globalvars.username}.programs.zsh.shellAliases = { nrb = "sudo nixos-rebuild switch --flake ~/nixos#daytona --impure"; };

  globalvars.efiuuid = "CC86-A773";
  globalvars.bootuuid = "1934821d-cd0d-4ad6-8770-83a684b65dd8";
  globalvars.rootuuid = "077da8d5-d067-48c7-9560-dde9b6409ff8";

  steam.enable = true;
  ananicy-cpp.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
}
