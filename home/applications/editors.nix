{ inputs, self, ... }: {
  flake.homeModules.editors = { config, lib, pkgs, ... }: {
    programs = {
      zed-editor = {
        enable = true;
      };
      vscode = {
        enable = true;
      };
    };
  };
}
