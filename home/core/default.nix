{
  flake.homeModules.base = { osConfig, pkgs, config, ... }: {
    home.username = "${osConfig.vars.username}";
    home.homeDirectory = "/home/${osConfig.vars.username}";
    home.stateVersion = "26.05";
  };
}
