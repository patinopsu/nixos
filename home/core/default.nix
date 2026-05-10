{
  flake.homeModules.base = { osConfig, pkgs, config, ... }: {
    home.username = "${osConfig.vars.username}";
    home.homeDirectory = "/home/${osConfig.vars.username}";
    home.stateVersion = "26.05";

    programs.distrobox = {
      enable = true;
      settings = {
        container_manager = "podman";
        container_additional_volumes= "/nix/store:/nix/store:ro /etc/profiles/per-user:/etc/profiles/per-user:ro /etc/static/profiles/per-user:/etc/static/profiles/per-user:ro";
      };
    };
  };
}
