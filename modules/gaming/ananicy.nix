{ config, lib, pkgs, ... }:

{
  services.ananicy = lib.mkIf config.vars.gaming.ananicy-cpp.enable {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
}
