{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
  };
  stylix.targets.vscode.enable = false;
}
