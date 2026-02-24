{ lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      gpg = {
        format = "ssh";
      };
      user = {
        name  = "Patin Muangjan";
        email = "patin@patin.dev";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILO0F9jC5uBccmMoBN71OR0zNjl8sKCYjZAEN/qKsSkN";
      };
    };
  };
}