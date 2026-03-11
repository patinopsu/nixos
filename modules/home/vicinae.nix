{ pkgs, lib, ... }:

{
  services.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      "$schema" = "https://vicinae.com/schemas/config.json";
      launcher_window = lib.mkForce {
        opacity = 0.80;
      };
      pop_to_root_on_close = true;
    };
  };
}
