{ config, pkgs, ... }:

{
  home.username = "${config.globalvars.username}";
  home.homeDirectory = "/home/${config.globalvars.username}";
  home.stateVersion = "25.11";
}
