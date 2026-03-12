{ config, lib, pkgs, ... }:

{
  home.file.".p10k.zsh" = {
    source = ../../src/p10k.zsh;
  };
  home.sessionVariables = {
    EDITOR = "zeditor";
  };
  services.udiskie = {
    enable = true;
  };
}
