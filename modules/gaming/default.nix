{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, config, ... }: {
    imports = [
      inputs.nixos-millennium.nixosModules.default
    ];
    programs = {
      steam = {
        enable = true;
      };
    };
    services = {
      ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-rules-cachyos;
      };
    };
    home-manager.users.${config.vars.username} = {
      programs.steam = {
        theme = pkgs.millenniumThemes.adwaita;
        plugins = with pkgs.millenniumPlugins; [
          extendium
        ];
      };
    };
  };
}
