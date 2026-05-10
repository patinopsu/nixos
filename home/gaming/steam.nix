{ self, inputs, ... }: {
  flake.homeModules.steam = { pkgs, config, ... }: {
    programs.steam = {
      theme = pkgs.millenniumThemes.adwaita;
      plugins = with pkgs.millenniumPlugins; [
        extendium
      ];
    };
  };
}
