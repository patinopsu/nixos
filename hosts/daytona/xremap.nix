{ config, lib, pkgs, inputs, ... }:

{
  home-manager.users.patin = {
    imports = [
      inputs.xremap-flake.homeManagerModules.default
    ];
    services.xremap = {
      enable = true;
      withKDE = true;
      yamlConfig = builtins.readFile ../../src/daytona_xremap.yaml;
    };
  };
}