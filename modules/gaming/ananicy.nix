{ config, lib, pkgs, ... }:

{
  options = {
    ananicy-cpp.enable = lib.mkEnableOption "Enable Ananicy";
  };
  config = lib.mkIf config.ananicy-cpp.enable {
    services.ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
  };
}
