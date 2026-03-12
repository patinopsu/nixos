{ config, pkgs, ... }:

{
  home.username = "${config.vars.username}";
  home.homeDirectory = "/home/${config.vars.username}";
  home.stateVersion = "25.11";
}
